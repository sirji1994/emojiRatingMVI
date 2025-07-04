//
//  EmojiRatingModel.swift
//  EmojiRating
//
//  Created by Piyush Singh on 02/07/25.
//

import Foundation

struct EmojiRating: Identifiable, Equatable {
    let id = UUID()
    let emoji: String
    let message: String
}
