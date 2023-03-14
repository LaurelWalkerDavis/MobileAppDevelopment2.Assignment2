//
//  CryptoConverterViewModel.swift
//  Converter
//
//  Created by Laurel Walker Davis on 3/13/23.
//

import Foundation

class CryptoConverterViewModel : ObservableObject { // must be observable to publish changes - observable only available to classes, not structs
    
    @Published var amount:Double? = nil
    @Published private(set) var listOfCurrencies = [ConvertModel<CryptoItemModel>]() //variable is public, but the setter is private // @Pub tells program that this is the variable that will be changing and published
    
    
    
    func fetchCurrencies() {
        self.listOfCurrencies = [
            ConvertModel(cardContent: CryptoItemModel(cryptoName: "US Dollar", cryptoCode: "USD", multiplier: 23450.0)),
            ConvertModel(cardContent: CryptoItemModel(cryptoName: "Ethereum", cryptoCode: "ETH", multiplier: 14.3)),
            ConvertModel(cardContent: CryptoItemModel(cryptoName: "Tether", cryptoCode: "USDT", multiplier: 23450.0)),
            ConvertModel(cardContent: CryptoItemModel(cryptoName: "BNB", cryptoCode: "BNB", multiplier: 77.2)),
            ConvertModel(cardContent: CryptoItemModel(cryptoName: "USD Coin", cryptoCode: "USDC", multiplier: 23454.0)),
            ConvertModel(cardContent: CryptoItemModel(cryptoName: "XRP", cryptoCode: "XRP", multiplier: 62113.0)),
        ]
    }
    

}
