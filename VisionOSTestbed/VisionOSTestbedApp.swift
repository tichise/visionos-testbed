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
        }.windowStyle(.automatic)
            .defaultSize(width: 0.5, height: 0.5, depth: 0.1, in: .meters)
        
        WindowGroup(id: WindowGroupId.chat.rawValue) {
            ChatContentView()
        }
        .windowStyle(.automatic)
        .defaultSize(width: 1, height: 0.5, depth: 0.1, in: .meters)

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
        
        WindowGroup(id: WindowGroupId.item.rawValue) {
            ItemView()
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 1, height: 1, depth: 1, in: .meters)
    }
}

/// WindowGroupIdを定義する
enum WindowGroupId: String {
    case chat = "Chat"
    case item = "Item"
}

