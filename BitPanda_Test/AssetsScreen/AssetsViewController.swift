//
//  AssetsViewController.swift
//  BitPanda_Test
//
//  Created by Juan Colilla on 21/10/21.
//

import UIKit

class AssetsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
    }
    
    func setupNavBar() {
        self.title = "Assets"
        self.navigationController?.navigationBar.prefersLargeTitles = true

    }


}

