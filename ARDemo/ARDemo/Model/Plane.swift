//
//  Plane.swift
//  ARDemo
//
//  Created by Глеб Писарев on 12.12.2022.
//

import UIKit
import SceneKit
import ARKit

class Plane: SCNNode {
    
    init(anchor: ARPlaneAnchor) {
        super.init()
        let planeGeometry = SCNPlane(width: CGFloat(anchor.planeExtent.width), height: CGFloat(anchor.planeExtent.height))
        
        let image = UIImage(named: "tron_grid.png")
        let matereal = SCNMaterial()
        matereal.diffuse.contents = image
        planeGeometry.materials = [matereal]
        
        self.geometry = planeGeometry
        self.position = SCNVector3Make(anchor.center.x, 0, anchor.center.z)
        self.transform = SCNMatrix4MakeRotation(Float(-Double.pi / 2.0), 1.0, 0.0, 0.0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
