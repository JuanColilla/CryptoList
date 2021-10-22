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
        // Number of Cells for Section
        if filterSelector.selectedSegmentIndex == 0 {
            if section == 0 {
                return viewModel.getCrypto().count
            } else if section == 1 {
                return viewModel.getCommodities().count
            } else {
                return viewModel.getFiat().count
            }
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Cell For Row At
        if filterSelector.selectedSegmentIndex == 0 {
            if indexPath.section == 0 {
                guard let cryptoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "assetCell", for: indexPath) as? AssetCollectionViewCell else {
                    return UICollectionViewCell()
                }
                
                return cryptoCell
            } else if indexPath.section == 1 {
                guard let commodityCell = collectionView.dequeueReusableCell(withReuseIdentifier: "assetCell", for: indexPath) as? AssetCollectionViewCell else {
                    return UICollectionViewCell()
                }
                
                return commodityCell
            } else {
                guard let fiatCell = collectionView.dequeueReusableCell(withReuseIdentifier: "fiatCell", for: indexPath) as? FiatCollectionViewCell else {
                    return UICollectionViewCell()
                }
                
                return fiatCell
            }
        } else {
            switch(filterSelector.selectedSegmentIndex) {
            case 1, 2:
                guard let cryptoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "assetCell", for: indexPath) as? AssetCollectionViewCell else {
                    return UICollectionViewCell()
                }
                return cryptoCell
            case 3:
                guard let fiatCell = collectionView.dequeueReusableCell(withReuseIdentifier: "fiatCell", for: indexPath) as? FiatCollectionViewCell else {
                    return UICollectionViewCell()
                }
                return fiatCell
            default:
                print("Default case at \(#function)")
                return UICollectionViewCell()
            }
        }
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // How many Sections
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
        return CGSize(width: 365, height: 80)
    }
    
}
