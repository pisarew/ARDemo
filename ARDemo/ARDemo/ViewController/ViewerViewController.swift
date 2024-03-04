//
//  ViewController.swift
//  ARDemo
//
//  Created by Глеб Писарев on 12.12.2022.
//
import UIKit
import SceneKit
import ARKit



class ViewerViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    private var costil = 0
    var model: ModelType = .void
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
        
        sceneView.showsStatistics = true
        
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        
        sceneView.autoenablesDefaultLighting = true

        let scene = SCNScene()
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = ARWorldTrackingConfiguration.PlaneDetection.horizontal
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        sceneView.session.pause()
    }

    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        
        if self.costil == 0 { 
            self.costil += 1
            let laneAnchor = anchor as! ARPlaneAnchor
            let plane = Plane(anchor: laneAnchor)
            node.addChildNode(plane)
            let paimio = Model(anchor: laneAnchor, type: model)
            node.addChildNode(paimio)
        }
    }
}
