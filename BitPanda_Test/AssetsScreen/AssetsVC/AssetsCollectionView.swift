//
//  AssetsCollectionViewDelegate.swift
//  BitPanda_Test
//
//  Created by Juan Colilla on 21/10/21.
//

import Foundation
import UIKit

extension AssetsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if filterSelector.selectedSegmentIndex == 0 {
            if section == 0 {
                return viewModel.getCrypto().count
            } else if section == 1 {
                return viewModel.getCommodities().count
            } else {
                return viewModel.getFiat().count
            }
        } else if filterSelector.selectedSegmentIndex == 1 {
            return viewModel.getCrypto().count
        } else if filterSelector.selectedSegmentIndex == 2 {
            return viewModel.getCommodities().count
        } else if filterSelector.selectedSegmentIndex == 3 {
            return viewModel.getFiat().count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if filterSelector.selectedSegmentIndex == 0 {
            if indexPath.section == 0 {
                guard let cryptoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "assetCell", for: indexPath) as? AssetCollectionViewCell else {
                    return UICollectionViewCell()
                }
                cryptoCell.configureCell(asset: viewModel.getCrypto()[indexPath.row])
                return cryptoCell
            } else if indexPath.section == 1 {
                guard let commodityCell = collectionView.dequeueReusableCell(withReuseIdentifier: "assetCell", for: indexPath) as? AssetCollectionViewCell else {
                    return UICollectionViewCell()
                }
                commodityCell.configureCell(asset: viewModel.getCommodities()[indexPath.row])
                return commodityCell
            } else {
                guard let fiatCell = collectionView.dequeueReusableCell(withReuseIdentifier: "fiatCell", for: indexPath) as? FiatCollectionViewCell else {
                    return UICollectionViewCell()
                }
                fiatCell.configureCell(fiat: viewModel.getFiat()[indexPath.row])
                return fiatCell
            }
        } else {
            switch(filterSelector.selectedSegmentIndex) {
            case 1:
                guard let cryptoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "assetCell", for: indexPath) as? AssetCollectionViewCell else {
                    return UICollectionViewCell()
                }
                cryptoCell.configureCell(asset: viewModel.getCrypto()[indexPath.row])
                return cryptoCell
            case 2:
                guard let commodityCell = collectionView.dequeueReusableCell(withReuseIdentifier: "assetCell", for: indexPath) as? AssetCollectionViewCell else {
                    return UICollectionViewCell()
                }
                commodityCell.configureCell(asset: viewModel.getCommodities()[indexPath.row])
                return commodityCell
            case 3:
                guard let fiatCell = collectionView.dequeueReusableCell(withReuseIdentifier: "fiatCell", for: indexPath) as? FiatCollectionViewCell else {
                    return UICollectionViewCell()
                }
                fiatCell.configureCell(fiat: viewModel.getFiat()[indexPath.row])
                return fiatCell
            default:
                print("Default case at \(#function)")
                return UICollectionViewCell()
            }
        }
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if filterSelector.selectedSegmentIndex == 0 {
            return 3
        } else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.identifier, for: indexPath) as? SectionHeader {
            if filterSelector.selectedSegmentIndex == 0 {
                if indexPath.section == 0 {
                    header.configureHeader(title: "Crypto")
                } else if indexPath.section == 1 {
                    header.configureHeader(title: "Commodities")
                } else {
                    header.configureHeader(title: "Fiat")
                }
                return header
            } else {
                switch(filterSelector.selectedSegmentIndex) {
                case 1:
                    header.configureHeader(title: "Crypto")
                case 2:
                    header.configureHeader(title: "Commodities")
                case 3:
                    header.configureHeader(title: "Fiat")
                default:
                    print("Default case at \(#function)")
                }
                return header
            }
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screen = UIScreen.main.bounds
        return CGSize(width: screen.width * 0.9, height: screen.height * 0.1)
    }
    
}
