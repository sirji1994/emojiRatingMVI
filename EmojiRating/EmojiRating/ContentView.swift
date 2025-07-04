//
//  ContentView.swift
//  EmojiRating
//
//  Created by Piyush Singh on 01/07/25.
//

import SwiftUI

struct ContentView: View {
    @State var ratingVM = RatingViewModel()
    
    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            Text("Please provide ratings !!!")
                .font(.title)
                .fontWeight(.medium)
                .foregroundStyle(Color.black)
            HStack(spacing: 15) {
                ForEach(ratingVM.allRatings) { rating in
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            ratingVM.sendRatingIntent(.tapRating(rating))
                        }
                    } label: {
                        Text(rating.emoji)
                            .font(.largeTitle)
                            .scaleEffect(ratingVM.selectedRating == rating ? 1.4 : 1.0)
                    }
                }
            }
            .padding(.bottom, 10)
            if let selectedRating = ratingVM.selectedRating {
                Text("You feel: \(selectedRating.emoji) \(selectedRating.message)")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.black)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Gradient(stops: [.init(color: Color.yellow, location: 0.5),
                                     .init(color: Color.mint.opacity(0.8), location: 1)]))
        .onAppear {
            ratingVM.createRatings()
        }
    }
}

#Preview {
    ContentView()
}
