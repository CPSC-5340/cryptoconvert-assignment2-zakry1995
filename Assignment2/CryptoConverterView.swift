//
//  CryptoConverterView.swift
//  Assignment2
//
//  Created by Ansley Ellen Davis on 3/24/24.
//
import SwiftUI

struct CryptoConverterView: View {
    @ObservedObject var viewModel = CryptoConverterViewModel()
    @State private var isEditing = false // Track if numeric keyboard is shown
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Crypto Converter")
                    .font(.title)
                    .padding()
                
                // Text field
                TextField("Enter Bitcoin Amount", text: $viewModel.bitcoinAmount, onEditingChanged: { editing in
                    isEditing = editing // Track editing status
                })
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle()) // Apply rounded border style
                .keyboardType(.numberPad) // Set keyboard type to numberPad
                
                // List of crypto conversions
                List(viewModel.cryptoCurrencies.indices, id: \.self) { index in
                    VStack {
                        HStack {
                            Text(viewModel.cryptoCurrencies[index].cryptoName)
                            Spacer()
                            Text("\(viewModel.equivalentCryptoAmounts[index], specifier: "%.2f")")
                        }
                        Divider()
                    }
                }
                .listStyle(PlainListStyle())
                
                Spacer()
                
                // Numeric keypad
                if isEditing {
                    LazyVGrid(columns: Array(repeating: GridItem(), count: 3)) {
                        ForEach(1..<10) { number in
                            Button("\(number)") {
                                viewModel.bitcoinAmount += "\(number)"
                            }
                            .font(.title)
                            .padding()
                        }
                        
                        Button("0") {
                            viewModel.bitcoinAmount += "0"
                        }
                        .font(.title)
                        .padding()
                        
                        Button(action: {
                            if !viewModel.bitcoinAmount.isEmpty {
                                viewModel.bitcoinAmount.removeLast()
                            }
                        }) {
                            Image(systemName: "delete.left")
                                .font(.title)
                                .padding()
                        }
                    }
                }
            }
            .navigationTitle("Crypto Converter")
            .onTapGesture {
                hideKeyboard() // Dismiss the keyboard when tapping outside the text field or numeric keypad
            }
        }
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct CryptoConverterView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoConverterView()
    }
}



