//
//  ConcerntrationThemeChooseViewController.swift
//  concerntaration
//
//  Created by Zomato on 28/06/19.
//  Copyright © 2019 Zomato. All rights reserved.
//

import UIKit

class ConcerntrationThemeChooseViewController: UIViewController
{
    
    let themes = [
        "Sports" : "⚽⚾🏀⛹🤾🥎🏈🏉🏐🏏🏑🏒🥅🥍",
        "Animal" : "🦅🦉🦜🐔🦃🕊🐣🐤🐥🐦🐧",
        "Faces": "😀😛😇😍😅😂🙄😏😎😭",
    ]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ChooseTheme"
        {
            if let themeName = {sender as? UIButton}()?.currentTitle, let theme = themes[themeName]
            {
                if let cvc = segue.destination as? ConcentrationViewController
                {
                    cvc.theme = theme

                }
            }
        }
        
    }
   
}
