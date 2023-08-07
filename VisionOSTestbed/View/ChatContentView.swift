//
//  ChatContentView.swift
//  VisionOSTestbed
//
//  Created by tichise on 2023/08/03.
//

import SwiftUI
import RealityKit
import RealityKitContent
import OpenAI
import ChatGPTUI

struct ChatContentView: View {
    
    @State var tabViewType: ChatTabViewType = .chat

    var chatViewModel = ChatViewModel(
        openAIClient: OpenAI(apiToken: UserDefaults.standard.string(forKey: AppConstants.chatGPTSecretKey) ?? "")
    )

    var body: some View {
        // TabViewを使う場合
        TabView(selection: $tabViewType,
                content:  {
            ChatView(chatViewModel: chatViewModel).tabItem {
                Label(ChatTabViewType.chat.title, systemImage: ChatTabViewType.chat.imageName)
            }.tag(ChatTabViewType.chat)
            
            ChatSettingsContentView().tabItem {
                Label(ChatTabViewType.settings.title, systemImage: ChatTabViewType.settings.imageName)
            }.tag(ChatTabViewType.settings)
        })
        .navigationTitle("Chat")
    }
}

enum ChatTabViewType: String, Identifiable, CaseIterable {
    case chat = "chat"
    case settings = "settings"

    var id: String {
        return rawValue
    }

    var title: String {
        switch self {
        case .settings:
            return "Settings"
        case .chat:
            return "Chat"
        }
    }
    
    var imageName: String {
        switch self {
        case .settings:
            return "gear"
        case .chat:
            return "bubble.left.and.bubble.right"
        }
    }
}
