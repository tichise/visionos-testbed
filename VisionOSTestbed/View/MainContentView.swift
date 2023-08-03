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
    @State private var showImmersiveSpace = false // ImmersiveSpaceを表示するかどうか
    @Environment(\.openImmersiveSpace) var openImmersiveSpace // ImmersiveSpaceを開くのに使う
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace // ImmersiveSpaceを閉じるのに使う
    @Environment(\.openWindow) private var openWindow // Windowを開くのに使う
    

    var body: some View {
        VStack {
            Model3D(named: "Scene", bundle: realityKitContentBundle)
                .padding(.bottom, 50)

            Text("Welcome VisionOS Testbed")

            Toggle("Show ImmersiveSpace", isOn: $showImmersiveSpace)
                .toggleStyle(.button)
                .padding(.top, 50)
            
            // SettingsContentViewを別のWindowで起動するボタン
            Button("Show SettingsContentView") {
                openWindow(id: WindowGroupId.settings.rawValue)
            }
        }
        .padding()
        .navigationTitle("Main")
        .onChange(of: showImmersiveSpace) { _, newValue in
            Task {
                if newValue {
                    await openImmersiveSpace(id: "ImmersiveSpace")
                } else {
                    await dismissImmersiveSpace()
                }
            }
        }
    
    }
}
