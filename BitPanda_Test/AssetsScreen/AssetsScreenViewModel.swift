//
//  AssetsScreenViewModel.swift
//  BitPanda_Test
//
//  Created by Juan Colilla on 22/10/21.
//

import Foundation


class AssetsScreenViewModel {
    

    func getCrypto() -> [Commodity] {
        return DataRetriever.shared.getCrypto()
    }
    
    func getCommodities() -> [Commodity] {
        return DataRetriever.shared.getCommodities()
    }
    
    func getFiat() -> [Fiat] {
        return DataRetriever.shared.getFiats()
    }
}
