//
//  ProgressiveView.swift
//  visionOS 3 Space Essentials
//
//  Created by 周铁 on 2024/7/6.
//

import SwiftUI
import RealityKit

struct ProgressiveView: View {
    var body: some View {
        VStack{
            Model3D(named:"flower_tulip")
            { phase in
                switch phase {
                case .empty:
                   ProgressView()
                case let .failure(error):
                    Text(error.localizedDescription)
                        .font(.title)
                case let .success(model):
                    model
                default:
                    Text("Unknown")
                        .font(.title)
                }
            }
        }
    }
}

#Preview {
    ProgressiveView()
}
