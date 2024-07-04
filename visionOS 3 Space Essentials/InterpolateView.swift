//
//  InterpolateView.swift
//  visionOS 3 Space Essentials
//
//  Created by ClareZhou on 2024/7/4.
//

import SwiftUI
import RealityKit

func interpolateBetweenPoints() -> Entity {
    
    //Base Sphere
    let entity = Entity()
    entity.position = [0, 0, 0]
    let radius: Float = 0.12
    let sphere = ModelEntity(
        mesh:.generateSphere(radius:radius),
        materials: [SimpleMaterial(color:.clear, roughness: 0.4, isMetallic: false)]
    )
    entity.addChild(sphere)
    
    // Original point and quaternions
    let origin = simd_float3(0,0,radius)
    
    let q0 = simd_quatf(angle:.pi/6, axis: simd_normalize(simd_float3(x:0,y:-0.1,z:0)))
    
    let u0 = simd_act(q0,origin)
    
    //
    let q1 = simd_quatf(angle:.pi/6, axis: simd_normalize(simd_float3(x:-0.1,y:0.1,z:0)))
    
    let u1 = simd_act(q1,origin)
    
    //
    let q2 = simd_quatf(angle:.pi/20, axis: simd_normalize(simd_float3(x:0.1,y:0,z:-0.1)))
    
    let u2 = simd_act(q2,origin)
    
    
    //start 0 point
    let point0 = ModelEntity(
        mesh:.generateSphere(radius: 0.01),
        materials: [SimpleMaterial(color:.red, roughness: 0.4,isMetallic: false)]
    )
    entity.addChild(point0)
    point0.position = u0
    
    //1st point
    let point1 = ModelEntity(
        mesh:.generateSphere(radius: 0.01),
        materials: [SimpleMaterial(color:.yellow, roughness: 0.4,isMetallic: false)]
    )
    entity.addChild(point1)
    point1.position = u1
    
    //2nd point
    let point2 = ModelEntity(
        mesh:.generateSphere(radius: 0.01),
        materials: [SimpleMaterial(color:.blue, roughness: 0.4,isMetallic: false)]
    )
    entity.addChild(point2)
    point2.position = u2
    
    //step & smoothness of route 1
    for t: Float in stride (from:0, to:1, by: 0.001){
        let q = simd_slerp(q0,q1,t)
        let p = ModelEntity(
            mesh:.generateSphere(radius: 0.002),
            materials: [SimpleMaterial(color:.red, roughness: 0.4,isMetallic: false)]
        )
        entity.addChild(p)
        p.position = q.act(origin)
    }
    
    //step & smoothness of route 2
    for t: Float in stride (from:0, to:1, by: 0.001){
        let q = simd_slerp_longest(q1,q2,t) //longer & route
        let p = ModelEntity(
            mesh:.generateSphere(radius: 0.002),
            materials: [SimpleMaterial(color:.red, roughness: 0.4,isMetallic: false)]
        )
        entity.addChild(p)
        p.position = q.act(origin)
    }
    return entity
    
}


struct InterpolateView: View {
    
    var body: some View {
        VStack {
                   RealityView { content in
                       let entity = interpolateBetweenPoints()
                       content.add(entity)
                   }
                   .edgesIgnoringSafeArea(.all)
               }
    }
}

#Preview {
    InterpolateView()
}
