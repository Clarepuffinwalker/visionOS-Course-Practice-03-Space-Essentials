//
//  RotationAnimeView.swift
//  visionOS 3 Space Essentials
//
//  Created by ClareZhou on 2024/7/4.
//

import SwiftUI
import RealityKit

// Define the extension for Transform
extension Transform {
    @inlinable
    public init(pitch x: Float = 0, yaw y: Float = 0, roll z: Float = 0) {
        let pitchRotation = simd_quatf(angle: x, axis: SIMD3<Float>(1, 0, 0))
        let yawRotation = simd_quatf(angle: y, axis: SIMD3<Float>(0, 1, 0))
        let rollRotation = simd_quatf(angle: z, axis: SIMD3<Float>(0, 0, 1))
        
        // Combine rotations
        let combinedRotation = pitchRotation * yawRotation * rollRotation
        self = Transform(rotation: combinedRotation)
    }
}

// Helper extension for quaternion to matrix conversion
extension simd_quatf {
    var matrix: float4x4 {
        return float4x4(self)
    }
}


struct RotationView: View {
    var body: some View {
        
        VStack{
            //RealityView Model Scale
            RealityView {content in
                
                guard let modelTwo = try? await
                        Entity(named:"toy_drummer_idle")
                else {
                    print("model not found")
                    return
                }
                print("model loaded successfully")
                modelTwo.position = SIMD3<Float>(0,-0.15,0)
                let scaleFactor: Float = 0.01
                modelTwo.scale = [scaleFactor / 2 , scaleFactor * 2,scaleFactor]
                modelTwo.components.set(GroundingShadowComponent(castsShadow: true))
                content.add(modelTwo)
            }        placeholder: {
                ProgressView()
            }
            .padding(.bottom)
            
            //Rotation View
            //RealityView Model Rotate
            HStack{
                // Define rotations
                let pitch = Transform(pitch: .pi / 4).matrix
                let yaw = Transform(yaw: .pi / 4).matrix
                let roll = Transform(roll: .pi / 4).matrix
               
                //Pitch
                VStack{
                    RealityView{ content, attachmentA in
                        if let modelA = try? await Entity(named:"toy_drummer_idle"){
                            modelA.position = [0,0,0]
                            modelA.scale = [0.0075,0.0075,0.0075]
                            // Apply rotations
                            modelA.transform.matrix *= pitch
                            content.add(modelA)
                            
                            
                            if let modelATag = attachmentA.entity(for:"A"){
                                modelATag.position = [0,-5,0]
                                modelATag.scale = [133,133,133]
                                modelA.addChild(modelATag)
                            }
                        }
                    }
                        
                attachments:{
                        Attachment(id: "A"){
                            Text("Pitch")
                                .font(.title2)
                                .padding()
                                .glassBackgroundEffect()
                        }
                    }
                    }
                    .padding(.leading)
                    
                    //Yaw
                    VStack{
                        RealityView{ content, attachmentB in
                            if let modelB = try? await Entity(named:"toy_drummer_idle"){
                                modelB.position = [0,0,0]
                                modelB.scale = [0.0075,0.0075,0.0075]
                                // Apply rotations
                                modelB.transform.matrix *= yaw
                                content.add(modelB)
                                
                                if let modelBTag = attachmentB.entity(for:"B"){
                                    modelBTag.position = [0,-5,0]
                                    modelBTag.scale = [133,133,133]
                                    modelB.addChild(modelBTag)
                                }
                            }
                        }
                        
                    attachments:{
                        Attachment(id: "B"){
                            Text("Yaw")
                                .font(.title2)
                                .padding()
                                .glassBackgroundEffect()
                        }
                    }
                    }
                    .padding(10)
                    
                    //Row
                    VStack{
                        RealityView{ content, attachmentC in
                            if let modelC = try? await Entity(named:"toy_drummer_idle"){
                                modelC.position = [0,0,0]
                                modelC.scale = [0.0075,0.0075,0.0075]
                                // Apply rotations
                                modelC.transform.matrix *= roll
                                content.add(modelC)
                                
                                
                                if let modelCTag = attachmentC.entity(for:"C"){
                                    modelCTag.position = [0,-5,0]
                                    modelCTag.scale = [133,133,133]
                                    modelC.addChild(modelCTag)
                                }
                            }
                        }
                    attachments:{
                        Attachment(id: "C"){
                            Text("Roll")
                                .font(.title2)
                                .padding()
                                .glassBackgroundEffect()
                        }
                    }
                    }
                    .padding(.leading)
                    
                }
            }
        }
    }
                

#Preview(windowStyle:.volumetric){
    RotationView()
}
