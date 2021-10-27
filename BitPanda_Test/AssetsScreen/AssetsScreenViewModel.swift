//
//  AssetsScreenViewModel.swift
//  BitPanda_Test
//
//  Created by Juan Colilla on 22/10/21.
//

import Foundation


class AssetsScreenViewModel {
    

    func getCrypto() -> [Asset] {
        return DataRetriever.shared.getCrypto()
    }
    
    func getCommodities() -> [Asset] {
        return DataRetriever.shared.getCommodities()
    }
    
    func getFiat() -> [Asset] {
        var fiatToShow: [Asset] = [Asset]()
        for fiat in DataRetriever.shared.getFiats() {
            if fiat.hasWallets ?? false {
                fiatToShow.append(fiat)
            }
        }
        return fiatToShow
    }
}
