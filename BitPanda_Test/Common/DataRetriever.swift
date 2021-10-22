//
//  DataRetriever.swift
//  BitPanda_Test
//
//  Created by Juan Colilla on 21/10/21.
//

import Foundation

class DataRetriever {
    
    static let shared = DataRetriever()
    
    var masterData: [Masterdata]
    
    private init() {
        self.masterData = Bundle.main.decode("Masterdata.json")
    }
    
    func getCrypto() -> [Commodity] {
        return masterData[0].data?.attributes?.cryptocoins ?? [Commodity]()
    }
    
    func getCommodities() -> [Commodity] {
        return masterData[0].data?.attributes?.commodities ?? [Commodity]()
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
    
    func getFiatWallets() -> [Fiatwallet] {
        return masterData[0].data?.attributes?.fiatwallets ?? [Fiatwallet]()
    }

}
