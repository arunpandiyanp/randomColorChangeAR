//
//  ColorChange.swift
//  randomColorChangeAR
//
//  Created by Arun Pandiyan on 01/09/22.
//

import Foundation
import ARKit
import RealityKit

class Coordinator: NSObject,ARSessionDelegate{
    weak var view: ARView?
    @objc func handleTap(_ recognizer:UITapGestureRecognizer){
        guard let view  =  self.view else {return}
        
        let taplocation = recognizer.location(in: view)
        
        if let entity = view.entity(at: taplocation) as? ModelEntity{
            let material = SimpleMaterial(color: UIColor.random(), isMetallic: true)
            entity.model?.materials = [material]
        }
        
        
    }
    
}
extension UIColor{
    static func random() -> UIColor{
        UIColor(displayP3Red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1), alpha: 1.0)
    }
}
