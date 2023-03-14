//
//  CryptoItem.swift
//  Converter
//
//  Created by Laurel Walker Davis on 3/13/23.
//

import SwiftUI

struct CryptoItem: View {
    var bitcoin : Int
    var crypto : ConvertModel<CryptoItemModel>
    
    //@ObservedObject var viewModel = CryptoConverterViewModel()
    
    @State private var amount = 1
    
    var body: some View {
            HStack {
                Text(crypto.cardContent.cryptoName)
                Spacer()
                Text(String(format: "%.1f", Double(bitcoin) * crypto.cardContent.multiplier))        
            
        }
    }
}


struct CryptoItem_Previews: PreviewProvider {
    static var previews: some View {
        CryptoItem(bitcoin: 0, crypto: ConvertModel(cardContent: CryptoItemModel(cryptoName: "", cryptoCode: "", multiplier: 1)))
    }
}

struct ListItem: View {
    var crypto : CryptoItemModel
    
    var body: some View {
        HStack {
            Text(crypto.cryptoName)
            Spacer()
            Text(String(crypto.multiplier))
        }
    }
}
