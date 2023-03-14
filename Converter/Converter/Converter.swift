//
//  ContentView.swift
//  Converter
//
//  Created by Laurel Walker Davis on 3/11/23.
//

import SwiftUI

struct Converter: View {    
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink("World Exchange Currency") {
                    CurrencyView()
                }
                NavigationLink("Crypto Exchange") {
                    CryptoView()
                }
            }.navigationTitle("Conversion App")
        }
    }
}

struct CurrencyView: View {
    @ObservedObject var viewModel = CurrencyConverterViewModel() //@Obs means we are observing changes here for publishing
    
    var body: some View {
        ScrollView {
            Text("1 USD Exchange Rate")
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                ForEach(viewModel.listOfCards) {
                    card in CurrencyItem(card: card)
                        .onTapGesture {
                            viewModel.flip(card: card)
                        }
                }
            }
        }.onAppear {
            viewModel.fetchCards()
        }
    }
}

struct CryptoView: View {
    @ObservedObject var viewModel = CryptoConverterViewModel()
    @State var bitcoin : Int = 0
    //@Obs means we are observing changes here for publishing
    
    private enum Field: Int, CaseIterable {
        case keystate
    }
    
    @State private var keystate: String = ""
    @FocusState private var focusedField: Field?
    
    var body: some View {
        VStack {
            Section {
                VStack {
                    HStack {
                        Text("Bitcoin")
                        TextField("Amount", value: $bitcoin, formatter: NumberFormatter())
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                            .focused($focusedField, equals: .keystate)
                    }.padding()
                }
            }
            Section {
                List {
                    ForEach(viewModel.listOfCurrencies) {
                        crypto in CryptoItem(bitcoin: bitcoin, crypto: crypto)
                    }
                }.listStyle(.grouped)
                    .onAppear {
                        viewModel.fetchCurrencies()
                    }
            }
        }
        .onTapGesture {
            focusedField = nil
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Converter()
    }
}
