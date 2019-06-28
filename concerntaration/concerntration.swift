
import Foundation

struct Concerntration
{
    var cards = [Card]()            //Array<Card>
    
    var indexOfOneAndOnlyFaceUpCard: Int?

    
    mutating func chooseCard(at index: Int)
    {
        assert(cards.indices.contains(index), "Concerntration.chooseCard (at: \(index)) : choosen index not in cards")
        if !cards[index].isMatched
        {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index
            {
                if cards[matchIndex].identifier == cards[index].identifier
                {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }
            else
            {
                for flipDownIndex in cards.indices
                {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    
    init(numberOfPairsOfCards: Int)
    {
        assert(numberOfPairsOfCards > 0, "Concerntration.init(\(numberOfPairsOfCards)) : you must have atleast one pair of card")
        for _ in  1...numberOfPairsOfCards
        {
                let card = Card()
                cards += [card,card]
        }
        cards.shuffle()
        // suffle card
    }
}




