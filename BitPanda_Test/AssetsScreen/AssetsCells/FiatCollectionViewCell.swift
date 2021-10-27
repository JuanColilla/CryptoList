//
//  FiatCollectionViewCell.swift
//  BitPanda_Test
//
//  Created by Juan Colilla on 21/10/21.
//

import UIKit
import SVGKit

class FiatCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var fiatImageView: UIImageView!
    @IBOutlet weak var fiatName: UILabel!
    @IBOutlet weak var fiatSymbol: UILabel!
    
    func configureCell(fiat: Asset) {
        DispatchQueue.main.async { [weak self] in
            self?.fiatImageView.image = SVGKImage(contentsOf: URL(string: fiat.logo)).uiImage
            self?.fiatName.text = fiat.name
            self?.fiatSymbol.text = fiat.symbol
        }
    }
    
}
