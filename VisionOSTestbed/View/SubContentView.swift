//
//  SubContentView.swift
//  VisionOSTestbed
//
//  Created by tichise on 2023/08/05.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct SubContentView: View {
    @State private var showImmersiveSpace = false // ImmersiveSpaceを表示するかどうか
    @Environment(\.openImmersiveSpace) var openImmersiveSpace // ImmersiveSpaceを開くのに使う
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace // ImmersiveSpaceを閉じるのに使う
    
    private let sneaker1 = URL(string: "https://developer.apple.com/augmented-reality/quick-look/models/nike-pegasus/sneaker_pegasustrail.usdz")!
    private let sneaker2 = URL(string: "https://developer.apple.com/augmented-reality/quick-look/models/nike-air-force/sneaker_airforce.usdz")!


    var body: some View {
        VStack(spacing: 50) {
            /*
             Model3D(named: "Scene", bundle: realityKitContentBundle)
                 .padding(.bottom, 50)
             */
            
            // Model3Dをダウンロードして表示する
            Model3D(url: sneaker1) { model in
                model
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
            } placeholder: {
                // ダウンロード中はプログレスバーを表示する
                ProgressView()
            }
            
            // Model3Dをダウンロードして表示する
            Model3D(url: sneaker2) { model in
                model
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
            } placeholder: {
                // ダウンロード中はプログレスバーを表示する
                ProgressView()
            }
            
            // ImmersiveSpaceを表示するかどうかを切り替えるトグル
            Toggle("Show ImmersiveSpace", isOn: $showImmersiveSpace)
                .toggleStyle(.button)
                .padding(.top, 50)
        }
        .padding()
        .navigationTitle("Sub")
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

#Preview {
    SubContentView()
}
