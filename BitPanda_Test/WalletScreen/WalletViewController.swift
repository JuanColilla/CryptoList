//
//  WalletViewController.swift
//  BitPanda_Test
//
//  Created by Juan Colilla on 21/10/21.
//

import UIKit

class WalletViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        
    }
    
    func setupNavBar() {
        self.title = "Wallets"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
