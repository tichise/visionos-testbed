//
//  ChatSettingsContentView.swift
//  VisionOSTestbed
//
//  Created by tichise on 2023/08/03.
//

import SwiftUI

// 設定画面
struct ChatSettingsContentView: View {
    var body: some View {
        @AppStorage(AppConstants.chatGPTSecretKey) var chatGPTSecretKey = ""

        VStack {
            Section(header: Text("ChatGPT")) {
                // ChatGPTのAPIトークンを編集してUserDefaultsに保存できるようにする
                HStack {
                    Text("SecretKey")
                    SecureField("", text: $chatGPTSecretKey).textFieldStyle(.roundedBorder)
                }.padding(.top, 50)
                
                Button("Get SecretKey") {
                    // https://platform.openai.com/account/api-keysをブラウザで開く
                    if let url = URL(string: "https://platform.openai.com/account/api-keys") {
                        UIApplication.shared.open(url)
                    }
                }
            }
            
            Spacer()
        }
        .navigationTitle("Settings")
        .padding()
    }
}
