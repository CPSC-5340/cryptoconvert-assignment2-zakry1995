//
//  MainView.swift
//  Assignment2
//
//  Created by Ansley Ellen Davis on 3/24/24.
//

import SwiftUI

import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            MainView() // Set MainView as the initial view
        }
    }
}

struct MainView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: CurrencyConverterView()) {
                    Text("Currency Converter")
                }
                NavigationLink(destination: CryptoConverterView()) {
                    Text("Crypto Converter")
                }
            }
            .navigationTitle("Converter")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

