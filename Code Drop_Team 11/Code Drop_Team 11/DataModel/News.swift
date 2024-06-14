//
//  News.swift
//  Code Drop_Team 11
//
//  Created by 김이예은 on 6/15/24.
//

import Foundation
import SwiftData

@Model
class News: Hashable, Equatable {
//    var id: ObjectIdentifier
    var id = UUID()
    var title: String
    var text: String
    var link: String
    
    init(title: String, text: String, link: String) {
        self.title = title
        self.text = text
        self.link = link
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: News, rhs: News) -> Bool {
        return lhs.title == rhs.title &&
        lhs.text == rhs.text &&
        lhs.link == rhs.link
    }
}
