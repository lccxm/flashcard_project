//
//  DeckModel.swift
//  FlashCards
//
//  Created by Lucca Molon on 13/10/21.
//

import Foundation

struct Deck {
    var flashcards: [FlashCard]
    var title: String
    var category: String
    var reminderDate: Date?
}
