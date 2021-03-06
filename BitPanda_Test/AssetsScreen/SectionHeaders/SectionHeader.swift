//
//  SectionHeader.swift
//  BitPanda_Test
//
//  Created by Juan Colilla on 22/10/21.
//

import UIKit

class SectionHeader: UICollectionReusableView {
    
    static let identifier = "SectionHeader"
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureHeader(title: String) {
        self.titleLabel.text = title
    }
}
