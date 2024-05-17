//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Jeffrey Kwakye on 07/05/2024.
//

import SwiftUI

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @State var leftCurrency: Currency = .goldPenny
    @State var rightCurrency: Currency = .silverPiece
   
    
    var body: some View {
        ZStack{
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            VStack{
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    
                HStack{
                    VStack{
                        HStack{
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 30)
                            Text(leftCurrency.name)
                                .foregroundStyle(.white)
                                .font(.headline)
                        }
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .padding(.bottom, -3)
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                    }
                    
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                    
                    VStack{
                        HStack{
    
                            Text(rightCurrency.name)
                                .foregroundStyle(.white)
                                .font(.headline)
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 30)

                        }
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .padding(.bottom, -3)
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                    }
                   
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                Spacer()
                HStack {
                    Spacer()
                    
                    Button {
                        showExchangeInfo.toggle()
                        print("value: \(showExchangeInfo)")
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                           
                    }
                    .padding(.trailing)
                    
                    
                }
            }
            
        }
        .sheet(isPresented: $showExchangeInfo) {
           ExchangeInfo()
            
        }
        .sheet(isPresented: $showSelectCurrency) {
           SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
        }
    }
}

#Preview {
    ContentView()
}
