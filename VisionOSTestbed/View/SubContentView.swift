//
//  SubContentView.swift
//  VisionOSTestbed
//
//  Created by tichise on 2023/08/05.
//

import SwiftUI
import RealityKit
import RealityKitContent
import Foundation

struct Sneaker: Codable {
    var name: String
    var url: URL
}

struct SubContentView: View {
    @State private var showImmersiveSpace = false // ImmersiveSpaceを表示するかどうか
    @Environment(\.openWindow) private var openWindow // Windowを開くのに使う

    @Environment(\.openImmersiveSpace) var openImmersiveSpace // ImmersiveSpaceを開くのに使う
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace // ImmersiveSpaceを閉じるのに使う
    
    // 商品配列
    let products = [
        Sneaker(name: "Nike Pegasus", url: URL(string: "https://developer.apple.com/augmented-reality/quick-look/models/nike-pegasus/sneaker_pegasustrail.usdz")!),
        Sneaker(name: "Nike Air Force", url: URL(string: "https://developer.apple.com/augmented-reality/quick-look/models/nike-air-force/sneaker_airforce.usdz")!)
    ]
    
    var body: some View {
        
        VStack {
            HStack(spacing: 50) {
                ForEach(products, id: \.name) { product in
                    VStack {
                        // Model3Dをダウンロードして表示する
                        Model3D(url: product.url) { model in
                            model
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200, height: 200)
                        } placeholder: {
                            // ダウンロード中はプログレスバーを表示する
                            ProgressView()
                        }
                        
                        Text(product.name)
                        
                        // ImmersiveSpaceを表示するかどうかを切り替えるトグル
                        Toggle("Open", isOn: $showImmersiveSpace)
                            .toggleStyle(.button)
                            .padding(.top, 50)
                        
                        Button("Open Item") {
                            openWindow(id: WindowGroupId.item.rawValue)
                        }
                         
                    }
                }
            }
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

enum Products {
    case sneaker1
    case sneaker2
}

#Preview {
    SubContentView()
}
