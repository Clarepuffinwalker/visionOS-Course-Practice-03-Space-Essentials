//
//  HoverView.swift
//  visionOS 3 Space Essentials
//
//  Created by ClareZhou on 2024/7/4.
//

import SwiftUI
import RealityKit

struct HoverView: View {
    var body: some View {
        RealityView {content in
            //set ball
            let ball = ModelEntity(
                mesh:.generateSphere(radius: 0.2),
                materials: [SimpleMaterial(color: .link, roughness: 0.4, isMetallic: true)]
            )
            //set components
            //shadowCast
            ball.components.set(GroundingShadowComponent(castsShadow: true))
            ball.components.set(InputTargetComponent(allowedInputTypes: [.indirect,.direct]))
            //HoverEffect
            ball.components.set(HoverEffectComponent())
            //Collision
            ball.collision = CollisionComponent(shapes: [.generateSphere(radius: 0.2)])
            //add content
            content.add(ball)
        }
    }
}

#Preview {
    HoverView()
}
