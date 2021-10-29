//
//  AssetCollectionViewCell.swift
//  BitPanda_Test
//
//  Created by Juan Colilla on 21/10/21.
//

import UIKit
import SVGKit

class AssetCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var assetImageView: UIImageView!
    @IBOutlet weak var assetName: UILabel!
    @IBOutlet weak var assetSymbol: UILabel!
    @IBOutlet weak var assetAveragePrice: UILabel!
    

    func configureCell(asset: Asset) {
        DispatchQueue.main.async { [weak self] in
            if self?.traitCollection.userInterfaceStyle == .light {
                self?.assetImageView.image = SVGKImage(contentsOf: URL(string: asset.iconWhite)).uiImage
            } else {
                self?.assetImageView.image = SVGKImage(contentsOf: URL(string: asset.iconBlack)).uiImage
            }
            self?.assetName.text = asset.name
            self?.assetSymbol.text = asset.symbol
            self?.assetAveragePrice.text = "\(String(Double(asset.averagePrice ?? "0.00")?.rounded(toPlaces: asset.precision) ?? 0.00))".localizedPrice()
        }
    }
    
    override func prepareForReuse() {
        assetImageView.image = nil
    }
    
}
