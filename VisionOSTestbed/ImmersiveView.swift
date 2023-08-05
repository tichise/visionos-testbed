//
//  ImmersiveView.swift
//  VisionOSTestbed
//
//  Created by tichise on 2023/08/03.
//

import SwiftUI
import RealityKit
import RealityKitContent

/// ImmersiveViewを表示する
struct ImmersiveView: View {
    @StateObject var immersiveViewModel = ImmersiveViewModel()
    
    private var entity = Entity()

    var body: some View {
        // RealityViewを使う
        
        //  RealityView はデフォルトで柔軟なサイズを持っており、表示しているRealityKitコンテンツに応じたサイズにはなりません。
        // より高度なRealityKitの使い方としては、RealityKitのイベントへの参加、座標変換、AR機能などがあります。
        // イベントの購読、座標変換の実行、AR機能の操作など、RealityKitのより高度な使用方法については RealityKitを参照してください、
        RealityView { content in
            // RealityKitコンテンツの追加
            if let scene = try? await Entity(named: "Immersive", in: realityKitContentBundle) {
                content.add(scene)
                content.add(entity)
                let modelEntity = immersiveViewModel.generateModelEntity(text: "Nike Pegasus")
                entity.addChild(modelEntity) // ContentEntityにテキストを追加する
            }
        }
    }
}

#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits) // sizeThatFits は、ビューの内容に基づいて最適なサイズを計算します。
}
