//
//  CurrencyTip.swift
//  LOTRConverter
//
//  Created by Jeffrey Kwakye on 20/05/2024.
//

import Foundation
import TipKit

struct CurrencyTip: Tip {
    var title = Text("Change currency")
    
    var message: Text? = Text("click on either the left or right currency to change currency")
}
