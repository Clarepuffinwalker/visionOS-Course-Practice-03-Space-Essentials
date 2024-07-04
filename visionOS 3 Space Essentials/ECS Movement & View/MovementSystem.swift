//
//  MovementSystem.swift
//  visionOS 3 Space Essentials
//
//  Created by ClareZhou on 2024/7/4.
//

import Foundation
import RealityKit

//define System

public struct MoveSystem: System{
    static let moveQuery = EntityQuery(where: .has(MoveComponent.self))
    
    public init(scene: Scene) {
    }
    
    public func update(context: SceneUpdateContext) {
        let entites = context.scene.performQuery(Self.moveQuery)
        
        for entity in entites{
            guard var moveComponent = entity.components[MoveComponent.self] else {
                continue
            }
            
                //check and sync angle
                moveComponent.angle += moveComponent.speed * Float(context.deltaTime)
                
                //Calculate position
                let center = moveComponent.center
                let x = cos(moveComponent.angle) * moveComponent.radius + center.x
                let y = sin(moveComponent.angle) * moveComponent.radius + center.y
                entity.position = SIMD3<Float>(x,y,entity.position.z)
                
                entity.components[MoveComponent.self] = moveComponent
            }
        }
    }
