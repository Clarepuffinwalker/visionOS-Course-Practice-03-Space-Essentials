//
//  DragView.swift
//  visionOS 3 Space Essentials
//
//  Created by ClareZhou on 2024/7/4.
//

import SwiftUI
import RealityKit

struct DragView: View {
    var body: some View {
        
        RealityView {content in
            //set ball
            let ball = ModelEntity(
                mesh:.generateSphere(radius: 0.2),
                materials: [SimpleMaterial(color: .orange.withAlphaComponent(0.8), roughness: 0.4, isMetallic: false)]
            )
            //set components
            //shadowCast
            ball.components.set(GroundingShadowComponent(castsShadow: true))
            ball.components.set(InputTargetComponent(allowedInputTypes: [.indirect,.direct]))
            //Collision
            ball.collision = CollisionComponent(shapes: [.generateBox(width: 0.4, height: 0.4, depth: 0.4)])
            //add content
            content.add(ball)
        }
        //interact
        .gesture(
            DragGesture()
                .targetedToAnyEntity()
                .onChanged{ value in
                    let target = value.entity
                    target.position = value.convert(value.location3D, from: .local, to: target.parent!)
                }
        )
    }
}

#Preview {
    DragView()
}
