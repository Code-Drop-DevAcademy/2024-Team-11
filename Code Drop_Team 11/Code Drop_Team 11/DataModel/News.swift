//
//  News.swift
//  Code Drop_Team 11
//
//  Created by 김이예은 on 6/15/24.
//

import Foundation

struct News: Hashable, Equatable {
//    var id: ObjectIdentifier
    var title: String
    var text: String
    var link: String
    
    static func == (lhs: News, rhs: News) -> Bool {
        return lhs.title == rhs.title &&
        lhs.text == rhs.text &&
        lhs.link == rhs.link
    }
}
