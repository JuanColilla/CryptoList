//
//  DataRetriever.swift
//  BitPanda_Test
//
//  Created by Juan Colilla on 21/10/21.
//

import Foundation

class DataRetriever {
    
    static let shared = DataRetriever()
    
    var masterData: MasterPayloadFileData
    
    private init() {
        self.masterData = Bundle.main.decode(MasterPayloadFileData.self, from: "Masterdata.json")
    }
    
    func getCrypto() -> [Asset] {
        return masterData.data.attributes.cryptocoins
    }
    
    func getCommodities() -> [Asset] {
        return masterData.data.attributes.commodities
    }

    func getFiats() -> [Asset] {
        return masterData.data.attributes.fiats
    }

    func getWallets() -> [Wallet] {
        return masterData.data.attributes.wallets
    }

    func getCommoditiesWallets() -> [Wallet] {
        return masterData.data.attributes.comoditiesWallets
    }

    func getFiatWallets() -> [Wallet] {
        return masterData.data.attributes.fialWallets
    }

}
