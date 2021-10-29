//
//  WalletsScreenViewModel.swift
//  BitPanda_Test
//
//  Created by Juan Colilla on 28/10/21.
//

import Foundation

class WalletsScreenViewModel {
    
    var assets: [Asset]
    var fiats: [Asset]
    
    init() {
        assets = DataRetriever.shared.getCrypto()
        assets.append(contentsOf: DataRetriever.shared.getCommodities())
        fiats = DataRetriever.shared.getFiats()
    }
    
    // MARK: - Wallets Getters
    
    func getWallets() -> [Wallet] {
        return prepareWalletsToShow(wallets: DataRetriever.shared.getWallets())
    }
    
    func getFiatWallets() -> [Wallet] {
        return prepareWalletsToShow(wallets: DataRetriever.shared.getFiatWallets())
    }
    
    func getCommodityWallets() -> [Wallet] {
        return prepareWalletsToShow(wallets: DataRetriever.shared.getCommoditiesWallets())
    }
    
    // MARK: - Data Processing Pipeline
    
    private func prepareWalletsToShow(wallets: [Wallet]) -> [Wallet] {
        var walletsToReturn = discardDeletedWallets(wallets: wallets)
        walletsToReturn = fetchWalletIcons(wallets: &walletsToReturn)
        return orderWalletsByBalance(wallets: walletsToReturn)
    }
    
    private func orderWalletsByBalance(wallets: [Wallet]) -> [Wallet] {
        return wallets.sorted(by: { Double($0.balance) ?? 0.0 > Double($1.balance) ?? 0.0 })
    }
    
    private func discardDeletedWallets(wallets: [Wallet]) -> [Wallet] {
        var walletsToReturn = [Wallet]()
        
        for wallet in wallets {
            if wallet.isDeleted == false{
                walletsToReturn.append(wallet)
            }
        }
        
        return walletsToReturn
    }
    
    private func fetchWalletIcons(wallets: inout [Wallet]) -> [Wallet] {
        
        wallets.forEach { wallet in
            if wallet.type == .wallet {
                assets.forEach { asset in
                    if asset.symbol == wallet.symbol {
                        wallet.iconWhite = asset.iconWhite
                        wallet.iconBlack = asset.iconBlack
                    }
                }
            } else {
                fiats.forEach { fiat in
                    if fiat.symbol == wallet.symbol {
                        wallet.iconWhite = fiat.logo
                        wallet.iconBlack = fiat.logo
                    }
                }
            }
        }
        return wallets
    }
}
