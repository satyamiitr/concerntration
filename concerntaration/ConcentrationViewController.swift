
import UIKit

class ConcentrationViewController: UIViewController {
    
    
    private lazy var game = Concerntration(numberOfPairsOfCards: (CardButtons.count+1) / 2)
    
    
    @IBOutlet weak var CountTillNow: UILabel!{
        didSet{
            updateFlipCount()
        }
    }
    
    private(set) var Cnt = 0{
        didSet{
            updateFlipCount()
        }
    }
    private func updateFlipCount()
    {
        let attributes: [NSAttributedString.Key : Any] = [
        .strokeWidth : 5.0
        ]
    
        let attributedString  = NSAttributedString(string: "Flips: \(Cnt)", attributes: attributes)
        CountTillNow.attributedText = attributedString
    }

    
    
    @IBOutlet var CardButtons: [UIButton]!

    
    @IBAction func TouchCard(_ sender: UIButton)
    {
        Cnt+=1
        if let cardNumber = CardButtons.firstIndex(of: sender)
        {
                game.chooseCard(at: cardNumber)
                updateViewFromModel()
        }
    }
    
    func updateViewFromModel()
    {
        if CardButtons != nil
        {
            for index in CardButtons.indices
            {
                let button = CardButtons[index]
                let card = game.cards[index]
                
                if card.isFaceUp
                {
                    button.setTitle(emoji(for: card), for: UIControl.State.normal)
                    button.backgroundColor = #colorLiteral(red: 1, green: 0.943181932, blue: 0.9012045264, alpha: 0.8514019692)
                }
                else
                {
                    button.setTitle("", for: UIControl.State.normal)
                    button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
                }
            }
        }
    }

    var theme: String?
    {
        didSet{
            EmojiChoices = theme ?? ""
            emoji = [:]
            updateViewFromModel()
        }
    }
    var EmojiChoices = "😀😛😇😍😅😂🙄😏😎😭"
    
    var emoji = [Int : String]()

    func emoji(for card: Card)-> String
    {
        if emoji[card.identifier] == nil , EmojiChoices.count > 0
        {
                let x = Int(arc4random_uniform(UInt32(EmojiChoices.count)))
                let randomIndex = EmojiChoices.index(EmojiChoices.startIndex, offsetBy: x)
                //let randomIndex = Int(arc4random_uniform(UInt32(EmojiChoices.count)))
                emoji[card.identifier]=String(EmojiChoices.remove(at: randomIndex))
            //print(String(randomIndex) + emoji[card.identifier]!)
        }
        
        return emoji[card.identifier]!
    }
}
