//
//  MemoryGame.swift
//  Memorize
//
//  Created by Chloe Chen on 3/30/23.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    mutating func choose(_ card: Card) {
        print("hello choose")
        let chosenIndex = index(of:card)
        cards[chosenIndex].isFaceUp.toggle()
        
        print("\(cards)")
    }
    func index(of card: Card) -> Int {
        for index in 0..<cards.count{
            if cards[index].id == card.id {
                return index
            }
        }
        return 0
    }
    init(numberOfPairsOfCards: Int, createCardContent: (Int)->CardContent){
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content:content, id:pairIndex*2 ))
            cards.append(Card(content:content,id:pairIndex*2+1 ))
            
        }
        cards.shuffle()
    }
    struct Card: Identifiable {
       
        
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
        
    }
}
