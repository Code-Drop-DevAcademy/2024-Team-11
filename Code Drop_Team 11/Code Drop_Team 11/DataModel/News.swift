//
//  News.swift
//  Code Drop_Team 11
//
//  Created by 김이예은 on 6/15/24.
//

import Foundation

class News: Hashable, Equatable, Identifiable {
//    var id: ObjectIdentifier
    
    var id = UUID()
    var title: String
    var text: String
    var link: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    init(id: UUID = UUID(), title: String, text: String, link: String) {
        self.id = id
        self.title = title
        self.text = text
        self.link = link
    }
    
    static func == (lhs: News, rhs: News) -> Bool {
        return lhs.title == rhs.title &&
        lhs.text == rhs.text &&
        lhs.link == rhs.link
    }
}
