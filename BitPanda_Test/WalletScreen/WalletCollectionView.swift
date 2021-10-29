//
//  WalletCollectionView.swift
//  BitPanda_Test
//
//  Created by Juan Colilla on 28/10/21.
//

import Foundation
import UIKit

extension WalletViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return viewModel.getFiatWallets().count
        } else if section == 1 {
            return viewModel.getWallets().count
        } else {
            return viewModel.getCommodityWallets().count
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

            if indexPath.section == 0 {
                guard let fiatWalletCell = collectionView.dequeueReusableCell(withReuseIdentifier: reusableWalletCell, for: indexPath) as? WalletCollectionViewCell else {
                    return UICollectionViewCell()
                }
                fiatWalletCell.configureCell(wallet: viewModel.getFiatWallets()[indexPath.row])
                return fiatWalletCell
            } else if indexPath.section == 1 {
                guard let walletCell = collectionView.dequeueReusableCell(withReuseIdentifier: reusableWalletCell, for: indexPath) as? WalletCollectionViewCell else {
                    return UICollectionViewCell()
                }
                walletCell.configureCell(wallet: viewModel.getWallets()[indexPath.row])
                return walletCell
            } else {
                guard let commodityWalletCell = collectionView.dequeueReusableCell(withReuseIdentifier: reusableWalletCell, for: indexPath) as? WalletCollectionViewCell else {
                    return UICollectionViewCell()
                }
                commodityWalletCell.configureCell(wallet: viewModel.getCommodityWallets()[indexPath.row])
                return commodityWalletCell
            }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.identifier, for: indexPath) as? SectionHeader {
            if indexPath.section == 0 {
                header.configureHeader(title: "Fiat Wallets")
            } else if indexPath.section == 1 {
                header.configureHeader(title: "Wallets")
            } else {
                header.configureHeader(title: "Commodity Wallets")
            }
            return header
        } else {
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screen = UIScreen.main.bounds
        return CGSize(width: screen.width * 0.9, height: screen.height * 0.1)
    }
    
    
    
}
