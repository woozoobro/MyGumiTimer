//
//  GumiListViewController.swift
//  MyGumiTimer
//
//  Created by 우주형 on 2022/10/27.
//

import UIKit
import RealmSwift

class GumiListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        if let flowlayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayout.estimatedItemSize = .zero
        }
    }
}

extension GumiListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GumiCell", for: indexPath) as? GumiCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(date: "22.10.27 (월)", count: "15 구미")
        
        return cell
    }
}

extension GumiListViewController: UICollectionViewDelegateFlowLayout {
    
}
