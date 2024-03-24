//
// ContentView.swift : Assignment2
//
// Copyright © 2023 Auburn University.
// All Rights Reserved.


import SwiftUI

struct CurrencyConverterView: View {
    @ObservedObject var viewModel = CurrencyConverterViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: CryptoConverterView()) {
                    Text("Crypto Converter")
                }
                .padding()
                
                ScrollView{
                    LazyVGrid(columns: [GridItem(.adaptive(minimum:150))]) {
                        ForEach(viewModel.listOfCards) {card in
                            CurrencyItem(card: card)
                                .onTapGesture {
                                    viewModel.flip(card: card)
                                }
                        }
                    }
                }
                .onAppear{
                    viewModel.fetchCards()
                }
            }
            .navigationTitle("Currency Converter")
        }
    }
}

struct CurrencyConverterView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyConverterView()
    }
}



