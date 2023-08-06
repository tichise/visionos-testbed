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

    var chatViewModel = ChatViewModel(
        openAIClient: OpenAI(apiToken: UserDefaults.standard.string(forKey: AppConstants.chatGPTSecretKey) ?? "")
    )

    var body: some View {
        ChatView(chatViewModel: chatViewModel)
        .padding()
        .navigationTitle("Chat")
    }
}
