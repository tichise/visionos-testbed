//
//  ContentViewModel.swift
//  VisionOSTestbed
//
//  Created by tichise on 2023/08/03.
//

import SwiftUI

// コンテンツのViewModel
class ContentViewModel: ObservableObject {
    @Published public var index = 0
    
    @Published public var tabViewType: TabViewType = .main
}

enum TabViewType: String, Identifiable, CaseIterable {
    case main = "main"
    case settings = "settings"

    var id: String {
        return rawValue
    }

    var title: String {
        switch self {
        case .main:
            return "Main"
        case .settings:
            return "Settings"
        }
    }
    
    var imageName: String {
        switch self {
        case .main:
            return "figure.wave"
        case .settings:
            return "gear"
        }
    }
}
