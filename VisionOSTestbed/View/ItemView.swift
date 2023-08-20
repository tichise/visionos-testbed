//
//  ItemView.swift
//  VisionOSTestbed
//
//  Created by tichise on 2023/08/07.
//

import RealityKit
import SwiftUI
import RealityKitContent

struct ItemView: View {
            
    // 3d rotation
    @State var angle: Angle = .degrees(0)
    @State var startAngle: Angle?
    
    @State var axis: (CGFloat, CGFloat, CGFloat) = (.zero, .zero, .zero)
    @State var startAxis: (CGFloat, CGFloat, CGFloat)?
    
    // ScaleEffect
    @State var scale: Double = 2
    @State var startScale: Double?
    
    private var entity = Entity()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            RealityView { content in
                if let model = try? await Entity(named: "sneaker_airforce.usdz", in: realityKitContentBundle) {
                    content.add(model)
                    content.add(entity)
                }
            } update: { content in }
            .rotation3DEffect(angle, axis: axis) // 3d rotation
            .scaleEffect(scale)
            .simultaneousGesture(DragGesture() //
            .onChanged({ value in
                if let startAngle, let startAxis {
                    let _angle = sqrt(pow(value.translation.width, 2) + pow(value.translation.height, 2)) + startAngle.degrees
                    let axisX = ((-value.translation.height + startAxis.0) / CGFloat(_angle))
                    let axisY = ((value.translation.width + startAxis.1) / CGFloat(_angle))
                    angle = Angle(degrees: Double(_angle))
                    axis = (axisX, axisY, 0)
                } else {
                    startAngle = angle
                    startAxis = axis
                }
            }).onEnded({ _ in
                startAngle = angle
                startAxis = axis
            }))
            .simultaneousGesture(MagnifyGesture() // ピンチイン・アウト
            .onChanged { value in
                if let startScale {
                    scale = max(1, min(3, value.magnification * startScale))
                } else {
                    startScale = scale
                }
            }
            .onEnded { _ in
                startScale = scale
            })
            .zIndex(1)
            

            VStack {
                Text("sneaker_airforce")
            }
            .padding(32)
            .background(.ultraThinMaterial).cornerRadius(16)
            .font(.extraLargeTitle)
            .zIndex(1)
        }
    }
}
