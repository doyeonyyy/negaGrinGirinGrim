//
//  CollectionViewTry.swift
//  nagaGrinGirinGrim
//
//  Created by kiakim on 2023/08/15.
//

import UIKit

let cellID = "cell"

class CollectionViewTry : UIViewController{
    
    //MARK: properties
    let collectionViewSEP : UICollectionView = {
        let flowlayout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero , collectionViewLayout: flowlayout)
        flowlayout.scrollDirection = .horizontal //세로 세팅
        
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewSEP.dataSource = self
        collectionViewSEP.delegate = self
        
        view.addSubview(collectionViewSEP)
        
        collectionViewSEP.translatesAutoresizingMaskIntoConstraints = false
        
        collectionViewSEP.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionViewSEP.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionViewSEP.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionViewSEP.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionViewSEP.backgroundColor = .yellow
      
        collectionViewSEP.register(DemoCell.self, forCellWithReuseIdentifier: cellID)
    }
}

extension CollectionViewTry: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! DemoCell
        cell.backgroundColor = .red
        return cell
    }
    

    
}



extension CollectionViewTry: UICollectionViewDelegate{
    
}


extension CollectionViewTry:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath)->CGSize{
        return CGSize(width: (view.frame.width - 30)/4, height: (view.frame.width - 30)/4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
   
//
}
