//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Jeffrey Kwakye on 12/05/2024.
//

import SwiftUI

struct SelectCurrency: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var topCurrency: Currency
    @Binding var bottomCurrency: Currency
    
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack{
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                
                
                IconGrid(selectedCurrency: $topCurrency)
               
                
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                    
                IconGrid(selectedCurrency: $bottomCurrency)
                   

                
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
    SelectCurrency(topCurrency: .constant(.goldPenny), bottomCurrency: .constant(.silverPenny))
}

