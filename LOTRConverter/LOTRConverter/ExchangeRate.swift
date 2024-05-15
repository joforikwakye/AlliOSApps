//
//  ExchangeRate.swift
//  LOTRConverter
//
//  Created by Jeffrey Kwakye on 09/05/2024.
//

import SwiftUI


struct ExchangeRate: View {
    let leftImage: ImageResource
    let text: String
    let rightImage: ImageResource
    
    var body: some View {
        HStack{
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 25)
            Text(text)
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 25)
        }
    }
}
