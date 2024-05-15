//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Jeffrey Kwakye on 12/05/2024.
//

import SwiftUI

struct SelectCurrency: View {
    
    @Environment(\.dismiss) var dismiss
    @State var selectedCurrency: Currency
    
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack{
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                
                
                
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
                                }
                        }
                        
                    }
                }
                
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                    
                   

                
                Button("Done") {
                    dismiss()
                }
                .tint(.brown)
                .buttonStyle(.borderedProminent)
                .padding()
                .font(.title)
                .foregroundStyle(.white)
            }
            .foregroundStyle(.black)
            .padding()
            .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    SelectCurrency(selectedCurrency: .goldPenny)
}

