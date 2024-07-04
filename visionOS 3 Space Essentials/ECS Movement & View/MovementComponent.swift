//
//  MovementComponent.swift
//  visionOS 3 Space Essentials
//
//  Created by ClareZhou on 2024/7/4.
//

import Foundation
import RealityKit

//define Component
public struct MoveComponent: Component{
    public var speed: Float = 1.5
    public var radius: Float = 0.75
    public var angle: Float = 0.0
    
    public var center: SIMD3<Float>
    
    public init(position: SIMD3<Float>){
        center = [position.x - radius, position.y,position.z]
    }
}
