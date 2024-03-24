//
//  CryptoCOnverterViewModel.swift
//  Assignment2
//
//  Created by Ansley Ellen Davis on 3/24/24.
//

import Foundation

class CryptoConverterViewModel: ObservableObject {
    @Published var bitcoinAmount: String = "1" {
        didSet {
            calculateEquivalentCryptoAmounts()
        }
    }
    
    let cryptoCurrencies = [
        
        CryptoItemModel(cryptoName: "Bitcoin", cryptoCode: "BTC", multiplier: 1.0),
        CryptoItemModel(cryptoName: "US Dollar", cryptoCode: "USD", multiplier: 66266),
        CryptoItemModel(cryptoName: "Ethereum", cryptoCode: "ETH", multiplier: 19.38),
        CryptoItemModel(cryptoName: "Litecoin", cryptoCode: "LTC", multiplier: 633),
        CryptoItemModel(cryptoName: "Ripple", cryptoCode: "XRP", multiplier: 98000),
        CryptoItemModel(cryptoName: "Cardano", cryptoCode: "ADA", multiplier: 101044)
    ]
    
    @Published var equivalentCryptoAmounts: [Double] = []
    
    init() {
        calculateEquivalentCryptoAmounts()
    }
    
    private func calculateEquivalentCryptoAmounts() {
        guard let bitcoinValue = Double(bitcoinAmount) else {
            return
        }
        
        equivalentCryptoAmounts = cryptoCurrencies.map { $0.multiplier * bitcoinValue }
    }
}
