//
//  AssetsViewController.swift
//  BitPanda_Test
//
//  Created by Juan Colilla on 21/10/21.
//

import UIKit

class AssetsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var filterSelector: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupStatusBar()
        ownCollectionView()
    }
    
    func setupNavBar() {
        self.title = "Assets"
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
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
        
        //collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.identifier)
    }
    

}
