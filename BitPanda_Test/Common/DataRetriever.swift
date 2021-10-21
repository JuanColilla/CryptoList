//
//  DataRetriever.swift
//  BitPanda_Test
//
//  Created by Juan Colilla on 21/10/21.
//

import Foundation

class DataRetriever {
    
    let shared = DataRetriever()
    
    var masterData: [Masterdata]
    
    private init() {
        self.masterData = Bundle.main.decode("Masterdata.json")
    }
    
    func getCrypto() -> [Asset] {
        return masterData[0].data?.attributes?.cryptocoins ?? [Asset]()
    }
    
    func getCommodities() -> [Asset] {
        return masterData[0].data?.attributes?.commodities ?? [Asset]()
    }
    
    func getFiats() -> [Fiat] {
        return masterData[0].data?.attributes?.fiats ?? [Fiat]()
    }
    
    func getWallets() -> [Wallet] {
        return masterData[0].data?.attributes?.wallets ?? [Wallet]()
    }
    
    func getCommoditiesWallets() -> [Wallet] {
        return masterData[0].data?.attributes?.commodityWallets ?? [Wallet]()
    }
    
    func getFiatWallets() -> [FiatWallet] {
        return masterData[0].data?.attributes?.fiatwallets ?? [FiatWallet]()
    }

}
