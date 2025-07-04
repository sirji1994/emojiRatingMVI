# EmojiRatingMVI

This is single page Emoji Rating App created with help of MVI architecture.

🧩 Key Concepts
1. Model (State)

Represents the UI state at any given moment. It's a plain struct that holds all data needed for the view.

struct RatingState {

    var selectedRating: EmojiRating? = nil
}

2. View

A pure SwiftUI view that observes the state and renders it. It never mutates state directly.

struct RatingView: View {

    @Observable var viewModel: RatingViewModel
    ...
}

3. Intent

Represents user actions or system events. The View sends these to the ViewModel.

enum RatingIntent {

    case tapRating(EmojiRating)
}

4. ViewModel(Reducer)

Handles all logic. It receives Intents, reduces them into new State, and publishes updates.

@Observable
class RatingViewModel {

    var allRatings: [EmojiRating] = []
    var selectedRating: EmojiRating?
    ....
}

🔁 Unidirectional Data Flow

User Action (Intent)

        ↓
        
   ViewModel (Reducer)
   
        ↓
        
     New State
     
        ↓
        
      View (UI)
      
This strict flow ensures all state changes are traceable and simplifies debugging and testing.

✅ Benefits of MVI in iOS

Declarative UI works well with immutable state

Easy to plug into Combine or Swift Concurrency

Encourages modular, testable code

Ideal for SwiftUI and Kotlin Multiplatform projects sharing architecture concepts
