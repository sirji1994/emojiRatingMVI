//
//  RatingViewModel.swift
//  EmojiRating
//
//  Created by Piyush Singh on 02/07/25.
//

import Foundation
import Observation

@Observable
class RatingViewModel {
    var ratingState = RatingState()
    
    func createRatings() {
        ratingState.allRatings = [.init(emoji: "😡", message: "Angry"),
                      .init(emoji: "😐", message: "Neutral"),
                      .init(emoji: "🙂", message: "Satisfied"),
                      .init(emoji: "😄", message: "Happy"),
                      .init(emoji: "🤩", message: "Amazing")]
    }
    
    func sendRatingIntent(_ intent: RatingIntent) {
        switch intent {
        case .tapRating(let rating):
            ratingState.selectedRating = ratingState.selectedRating == rating ? nil : rating
        }
    }
}
