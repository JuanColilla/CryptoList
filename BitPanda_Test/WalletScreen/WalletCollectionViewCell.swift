//
//  WalletCollectionViewCell.swift
//  BitPanda_Test
//
//  Created by Juan Colilla on 28/10/21.
//

import UIKit
import SVGKit

class WalletCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var walletImageView: UIImageView!
    @IBOutlet weak var walletName: UILabel!
    @IBOutlet weak var walletSymbol: UILabel!
    @IBOutlet weak var walletBalance: UILabel!
    @IBOutlet weak var defaultLabel: UILabel!
    
    @IBOutlet weak var walletFiatIndicator: UIStackView!
    
    func configureCell(wallet: Wallet) {
        
        DispatchQueue.main.async { [weak self] in
            if self?.traitCollection.userInterfaceStyle == .light {
                self?.walletImageView.image = SVGKImage(contentsOf: URL(string: wallet.iconWhite ?? "")).uiImage
            } else {
                self?.walletImageView.image = SVGKImage(contentsOf: URL(string: wallet.iconBlack ?? "")).uiImage
            }
        }
        
        defaultLabel.isHidden = wallet.isDefault ? true : false
        
        walletName.text = wallet.name
        walletSymbol.text = wallet.symbol
        walletBalance.text = wallet.balance
        
        if wallet.type != .fiatWallet {
            walletFiatIndicator.isHidden = true
        } else {
            walletFiatIndicator.isHidden = false
        }
    }
    
    
}
