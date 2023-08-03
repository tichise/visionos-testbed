//
//  ImmersiveView.swift
//  VisionOSTestbed
//
//  Created by tichise on 2023/08/03.
//

import SwiftUI
import RealityKit
import RealityKitContent

/// ImmersiveView
struct ImmersiveView: View {
    var body: some View {
        // RealityViewを使う
        
        //  RealityView はデフォルトで柔軟なサイズを持っており、表示しているRealityKitコンテンツに応じたサイズにはなりません。
        // より高度なRealityKitの使い方としては、RealityKitのイベントへの参加、座標変換、AR機能などがあります。
        // イベントの購読、座標変換の実行、AR機能の操作など、RealityKitのより高度な使用方法については RealityKitを参照してください、
        RealityView { content in
            // RealityKitコンテンツの追加
            if let scene = try? await Entity(named: "Immersive", in: realityKitContentBundle) {
                content.add(scene)
            }
        }
    }
}

#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
