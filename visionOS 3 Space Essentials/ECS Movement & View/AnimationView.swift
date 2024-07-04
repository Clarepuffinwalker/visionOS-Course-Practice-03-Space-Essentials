//
//  AnimationView.swift
//  visionOS 3 Space Essentials
//
//  Created by ClareZhou on 2024/7/4.
//

import SwiftUI
import RealityKit

struct AnimationView: View {
    
    private let radius: Float = 0.2
    
    @State var programmaticEntity = Entity()
    
    var body: some View {
        RealityView{content in
            let initPosition = SIMD3<Float>(x:0.5,y:0,z:0)
            var moveComponent = MoveComponent(position: initPosition)
            programmaticEntity = ModelEntity(
                mesh:.generateSphere(radius: radius),
                materials: [SimpleMaterial(color: .green, roughness: 0.2, isMetallic: false)])
            
                programmaticEntity.position = initPosition
                programmaticEntity.components[MoveComponent.self] = moveComponent
                content.add(programmaticEntity)
            
        }
    }
}

#Preview {
    AnimationView()
}
