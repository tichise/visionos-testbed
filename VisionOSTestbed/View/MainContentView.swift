//
//  MainContentView.swift
//  VisionOSTestbed
//
//  Created by tichise on 2023/08/03.
//

import SwiftUI
import RealityKit
import RealityKitContent

// メイン画面
struct MainContentView: View {
    @Environment(\.openWindow) private var openWindow // Windowを開くのに使う

    var body: some View {
        VStack {
            // SubContentViewを別のWindowで起動するボタン
            Button("Open Window") {
                openWindow(id: WindowGroupId.settings.rawValue)
            }
        }
        .padding()
        .navigationTitle("Main")

    }
}
