//
//  Emoji.swift
//  Emoji
//
//  Created by 1 on 2023-07-13.
//

import Foundation

struct EmojiTypeViewModel {
    let title: String
    let emoji: String
    let desc: String
    let groupType: String
    var isFavorite = false
    
    init(model: EmojiType) {
        self.title = model.slug
        self.emoji = model.character
        self.desc = model.unicodeName
        self.groupType = model.group 
        self.isFavorite = false
    }
}

struct EmojiType : Codable {
    
    let slug : String
    let character : String
    let unicodeName : String
    let codePoint : String
    let group :String
    let subGroup : String
//    var isFavorite = false
    
}



