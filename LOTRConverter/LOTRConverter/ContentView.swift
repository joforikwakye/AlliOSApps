//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Jeffrey Kwakye on 07/05/2024.
//

import SwiftUI

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var leftAmount = ""
    @State var rightAmount = ""
   
    
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
                            Image(.silverpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 30)
                            Text("Silver Piece")
                                .foregroundStyle(.white)
                                .font(.headline)
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
    
                            Text("Gold Piece")
                                .foregroundStyle(.white)
                                .font(.headline)
                            Image(.goldpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 30)
                            
                        
                                
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
    }
}

#Preview {
    ContentView()
}
