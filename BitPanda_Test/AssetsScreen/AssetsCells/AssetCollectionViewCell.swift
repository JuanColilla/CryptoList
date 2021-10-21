//
//  AssetCollectionViewCell.swift
//  BitPanda_Test
//
//  Created by Juan Colilla on 21/10/21.
//

import UIKit

class AssetCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var assetImageView: UIImageView!
    @IBOutlet weak var assetName: UILabel!
    @IBOutlet weak var assetSymbol: UILabel!
    @IBOutlet weak var assetAveragePrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell() {

    }
    
}
