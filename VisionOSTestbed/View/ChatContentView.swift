//
//  ChatContentView.swift
//  VisionOSTestbed
//
//  Created by tichise on 2023/08/03.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ChatContentView: View {
    
    // ChatViewModelを利用する
    @ObservedObject var chatViewModel = ChatViewModel()
    
    var body: some View {
        VStack {
            // SubContentViewを別のWindowで起動するボタン
            Button("Send Chat") {
                chatViewModel.sendChat(content: "Hello")
            }
        }.onAppear(perform: {
            // ChatViewModelのapiTokenにAppStorageで保存した値をapiTokenに設定する
            let apiToken = UserDefaults.standard.string(forKey: AppConstants.chatGPTSecretKey) ?? ""
            
            chatViewModel.apiToken = apiToken
        })
        .padding()
        .navigationTitle("Chat")
    }
}
