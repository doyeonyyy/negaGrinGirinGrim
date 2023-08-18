//
//  UserInfoCollectionView.swift
//  nagaGrinGirinGrim
//
//  Created by kiakim on 2023/08/15.
//

import UIKit

class userInfoCollectionView : UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        
        let itemWidth = (collectionView.frame.width - 30) / 2 // 2 columns with 10 units spacing
        let itemHeight = (collectionView.frame.height - 30) / 2 // 2 rows with 10 units spacing
        
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        collectionView.collectionViewLayout = layout
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        collectionView.backgroundColor = UIColor.white
    }
}

extension userInfoCollectionView{
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4 // Total number of cells (2 rows * 2 columns)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = UIColor.lightGray
        return cell
    }
}
