//
//  ContentView.swift
//  VisionOSTestbed
//
//  Created by tichise on 2023/08/03.
//

import SwiftUI
import RealityKit
import RealityKitContent

/// コンテンツ
struct ContentView: View {

    @State private var showImmersiveSpace = false // ImmersiveSpaceを表示するかどうか

    @Environment(\.openImmersiveSpace) var openImmersiveSpace // ImmersiveSpaceを開くのに使う
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace // ImmersiveSpaceを閉じるのに使う

    var body: some View {
        NavigationSplitView {
            List {
                Text("Item")
            }
            .navigationTitle("Sidebar")
        } detail: {
            VStack {
                Model3D(named: "Scene", bundle: realityKitContentBundle)
                    .padding(.bottom, 50)

                Text("Welcome VisionOS Testbed")

                Toggle("Show ImmersiveSpace", isOn: $showImmersiveSpace)
                    .toggleStyle(.button)
                    .padding(.top, 50)
            }
            .navigationTitle("Content")
            .padding()
        }
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
    ContentView()
}
