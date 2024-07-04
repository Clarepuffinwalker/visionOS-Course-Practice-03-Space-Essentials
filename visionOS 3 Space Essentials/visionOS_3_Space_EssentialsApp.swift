//
//  visionOS_3_Space_EssentialsApp.swift
//  visionOS 3 Space Essentials
//
//  Created by ClareZhou on 2024/7/4.
//

import SwiftUI

@main
struct visionOS_3_Space_EssentialsApp: App {
    
    //register custom ECS System
    init(){
        MoveComponent.registerComponent()
        MoveSystem.registerSystem()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(width: 1280,height: 720)
        }
        .windowResizability(.contentSize)
        
        WindowGroup(id:"Rotate") {
            RotationView()
        }
        
        WindowGroup(id:"Drag")  {
            DragView()
        }
        .windowStyle(.volumetric)
        
        WindowGroup(id:"Hover")  {
            HoverView()
        }
        .windowStyle(.volumetric)
        
        WindowGroup(id:"Anime")  {
            AnimationView()
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 8, height: 3, depth: 2, in: .meters)
        
    }
}
