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
    @StateObject var contentViewModel = ContentViewModel()

    var body: some View {
        // NavigationSplitViewを使う。NavigationSplitViewは
        NavigationSplitView {
            List {
                // indexを0に切り替えるButton
                Button("Main") {
                    contentViewModel.index = 0
                }
                
                // indexを1に切り替えるButton
                Button("Settings") {
                    contentViewModel.index = 1
                }
            
                
                
            }
            .navigationTitle("Sidebar")
        } detail: {
            if contentViewModel.index == 0 {
                MainContentView()
            } else if contentViewModel.index == 1 {
                SettingsContentView()
            }
        }
    }
}

#Preview {
    ContentView()
}
