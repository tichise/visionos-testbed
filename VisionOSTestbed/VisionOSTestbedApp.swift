//
//  VisionOSTestbedApp.swift
//  VisionOSTestbed
//
//  Created by tichise on 2023/08/03.
//

import SwiftUI

@main
struct VisionOSTestbedApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.defaultSize(width: 0.5, height: 0.5, depth: 0.1, in: .meters)
        
        WindowGroup(id: WindowGroupId.settings.rawValue) {
            SubContentView()
        }
        .windowStyle(.automatic)
        .defaultSize(width: 1, height: 0.5, depth: 0.1, in: .meters)

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}

/// WindowGroupIdを定義する
enum WindowGroupId: String {
    case settings = "Settings"
}

