//
//  Tab.swift
//  TwitterSegmentedControl
//
//  Created by Madalin Zaharia on 17.03.2023.
//

import Foundation

enum Tab: Int, CaseIterable {
    case forYou
    case trending
    case news
    
    var title: String {
        switch self {
        case .forYou:
            return "For you"
        case .trending:
            return "Trending"
        case .news:
            return "News"
        }
    }
}
