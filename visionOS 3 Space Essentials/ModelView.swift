//
//  ModelView.swift
//  visionOS 3 Space Essentials
//
//  Created by 周铁 on 2024/7/6.
//

import SwiftUI
import RealityKit

struct ModelView: View {
    var body: some View {
        VStack{
            Model3D(named:"flower_tulip") {model in
                model.opacity(0.9)
            }
        placeholder: {
            ProgressView()
        }
      }
        .padding()
    }
}

#Preview {
    ModelView()
}
