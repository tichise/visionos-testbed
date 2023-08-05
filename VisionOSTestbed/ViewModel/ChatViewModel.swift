//
//  OpenAIViewModel.swift
//

import SwiftUI
import OpenAI
import Combine

/// OpenAI用のViewModel
final class ChatViewModel: ObservableObject {
    
    public var openAI: OpenAI?
    
    /// OpenAIのAPIキー
    public var apiToken: String = ""
    
    
    private var cancellables = Set<AnyCancellable>()

    /// OpenAPIにプロンプトを送信して、解答を取得する
    /// - Parameters:
    ///  - prompt: プロンプト
    ///  - maxTokens: 最大トークン数
    func sendChat(content: String) {
        // @AppStorage(AppConstants.chatGPTSecretKey)で保存した値を取得する
        let apiToken = UserDefaults.standard.string(forKey: AppConstants.chatGPTSecretKey) ?? ""
        
        
        let openAI = OpenAI(apiToken: apiToken)
        let query = ChatQuery(model: .gpt3_5Turbo, messages: [.init(role: .user, content: content)])

        openAI.chatsStream(query: query)
        .sink { completion in
        } receiveValue: { result in
            print(result)
        }.store(in: &cancellables)
    }
}
