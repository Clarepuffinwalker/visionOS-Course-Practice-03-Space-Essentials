//
//  ContentView.swift
//  visionOS 3 Space Essentials
//
//  Created by ClareZhou on 2024/7/4.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @Environment(\.openWindow) var openWindow
    @Environment(\.dismissWindow) var dismissWindow
    
    @State private var isRotationWindowOpen = false
    @State private var isDragWindowOpen = false
    @State private var isHoverWindowOpen = false
    @State private var isAnimeWindowOpen = false

    var body: some View {
        VStack{
            Text("visionOS Class & Practice #3 Space Essentials")
                .font(.largeTitle)
                .padding(.top,50)
            
            
            HStack{
                InterpolateView()
                    .padding3D(.leading, 100)
                    .padding3D(.bottom, 100)
                /*
                 Model3D(named:"flower_tulip")
                 {model in
                 model
                 .resizable()
                 .scaledToFit()
                 .aspectRatio(contentMode: .fit)
                 }
                 placeholder: {
                 ProgressView()
                 */
                
                VStack {
                    
                    Toggle("Hover", isOn: $isHoverWindowOpen)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .onChange(of:isHoverWindowOpen)
                    {_,newValue in
                        if newValue {
                            openWindow(id:"Hover")
                        }
                        else{
                            dismissWindow(id:"Hover")
                        }
                    }
                    .toggleStyle(.button)
                    .padding(20)
                    
                    Toggle("Drag", isOn: $isDragWindowOpen)
                        .font(.title)
                        .onChange(of:isDragWindowOpen)
                    {_,newValue in
                        if newValue {
                            openWindow(id:"Drag")
                        }
                        else{
                            dismissWindow(id:"Drag")
                        }
                    }
                    .toggleStyle(.button)
                    .padding(20)
                    
                    Toggle("Rotation", isOn: $isRotationWindowOpen)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .onChange(of:isRotationWindowOpen)
                    {_,newValue in
                        if newValue {
                            openWindow(id:"Rotate")
                        }
                        else{
                            dismissWindow(id:"Rotate")
                        }
                    }
                    .toggleStyle(.button)
                    .padding(20)
                    
                    Toggle("Animation",isOn:$isAnimeWindowOpen)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .onChange(of: isAnimeWindowOpen)
                    {_,newValue in
                        if newValue {
                            openWindow(id:"Anime")
                        }
                        else{
                            dismissWindow(id:"Anime")
                        }
                    }
                    .toggleStyle(.button)
                    .padding(20)
                    
                }
                
            }
            .padding3D(.trailing, 200)
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
