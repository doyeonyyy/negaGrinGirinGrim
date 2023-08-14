//
//  MainPageViewController.swift
//  nagaGrinGirinGrim
//
//  Created by 보경 on 2023/08/14.
//

import UIKit

class MainPageViewController: UIViewController {

    
    
    
    
    
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}



extension MainPageViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10 /* <---- 여기에 도연님이패이지에서 입력되는 데이터들의 배열에 수만큼 나오게 해줘야함
                   예를들면  item.count     */
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCollectionCell", for: indexPath) as?
                   UICollectionViewCell else {
               return UICollectionViewCell()
           }
           return cell
    }
}
