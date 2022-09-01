//
//  ContentView.swift
//  randomColorChangeAR
//
//  Created by Arun Pandiyan on 01/09/22.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    var body: some View {
        return ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        arView.addGestureRecognizer(UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap(_:))))
        context.coordinator.view = arView
        arView.session.delegate = context.coordinator
        let boxAnchor = AnchorEntity(plane: .horizontal)
        let box = ModelEntity(mesh: MeshResource.generateBox(size: 0.3), materials: [SimpleMaterial(color: .blue, isMetallic: true)])
        box.generateCollisionShapes(recursive: true)
        boxAnchor.addChild(box)
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        return arView
        
    }
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
