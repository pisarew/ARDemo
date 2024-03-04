//
//  Model.swift
//  ARDemo
//
//  Created by Глеб Писарев on 04.03.2024.
//

import Foundation
import ARKit
import SceneKit

enum ModelType: String {
    case dragon = "art.scnassets/Dragon.scn"
    case paimio = "art.scnassets/Paimio_Sanatorium.usdz"
    case kratos = "art.scnassets/kratos.usdz"
    case void
}

class Model: SCNNode {
    
    init(anchor: ARPlaneAnchor, type: ModelType) {
        super.init()
        if let scene = SCNScene(named: type.rawValue) {
            scene.rootNode.childNodes.forEach {
                self.addChildNode($0 as SCNNode)
            }
        }
        self.scale = SCNVector3(0.003, 0.003, 0.003)
        self.position = SCNVector3(anchor.center.x, 0, anchor.center.z)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
