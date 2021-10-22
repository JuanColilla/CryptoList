//
//  AssetsViewController.swift
//  BitPanda_Test
//
//  Created by Juan Colilla on 21/10/21.
//

import UIKit

class AssetsViewController: UIViewController {
    
    let viewModel = AssetsScreenViewModel()
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var filterSelector: UISegmentedControl!
    
    @IBAction func filterApplied(_ sender: UISegmentedControl) {
        collectionView.reloadData()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupStatusBar()
        ownCollectionView()
    }
    
    func setupNavBar() {
        self.title = "Assets"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupStatusBar() {
        let statusbarAppearence = UINavigationBarAppearance()
        statusbarAppearence.backgroundColor = .white
        
        navigationItem.standardAppearance = statusbarAppearence
        navigationItem.scrollEdgeAppearance = statusbarAppearence
    }

    func ownCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.showsVerticalScrollIndicator = false
    }
    

}
