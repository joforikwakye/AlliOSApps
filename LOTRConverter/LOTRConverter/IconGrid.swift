//
//  IconGrid.swift
//  LOTRConverter
//
//  Created by Jeffrey Kwakye on 15/05/2024.
//

import SwiftUI

struct IconGrid: View {
    @Binding var selectedCurrency: Currency
    
    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
            
            ForEach(Currency.allCases) { currency in
                if selectedCurrency == currency {
                    
                    CurrencyIcon(currencyImage: currency.image, currencyText: currency.name)
                        .shadow(color:.black, radius: 10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(lineWidth: 3)
                                .opacity(0.5)
                        }
                } else {
                    CurrencyIcon(currencyImage: currency.image, currencyText: currency.name)
                        .onTapGesture {
                            selectedCurrency = currency
                            print("currency: \(selectedCurrency)")
                        }
                }
                
            }
        }
    }
}

#Preview {
    IconGrid(selectedCurrency: .constant(.goldPenny))
}
