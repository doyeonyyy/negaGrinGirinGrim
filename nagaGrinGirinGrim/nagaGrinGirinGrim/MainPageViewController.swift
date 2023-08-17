//
//  MainPageViewController.swift
//  nagaGrinGirinGrim
//
//  Created by 보경 on 2023/08/14.
//

import UIKit

class MainPageViewController: UIViewController {
    /*----------더미데이터 예시-----------*/
    var postTitles = [
        "식목일",
        "비 온 뒤 무지개",
        "가족과 피크닉",
        "수박으로 집을 만들면?",
        "우리 엄마가 최고야",
        "지구를 보호해야해요!",
    ]
    var postImgNames = [
        "tree",
        "rainbow",
        "park",
        "watermelonhouse",
        "mymom",
        "earth",
    ]
    /*--------------------------------*/
    
    @IBAction func goToWrite(_ sender: UIButton) {
        let writingStoryboard = UIStoryboard(name: "WritingStoryboard", bundle: nil)
            let writingViewController = writingStoryboard.instantiateViewController(withIdentifier: "writingViewControllerID") as? WritingViewController
            writingViewController?.delegate = self
            if let writingVC = writingViewController {
                self.navigationController?.pushViewController(writingVC, animated: true)
            }
        }
    
    
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
        UserDefaults.standard.set(postTitles, forKey: "postTitles")
        
        /*--------------------------컬렉션뷰 레이아웃---------------------------*/
        if let flowlayout = mainCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayout.estimatedItemSize = .zero
            
        }
        mainCollectionView.contentInset = UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 16)
        /*-------------------------------------------------------------------*/
    }
    @objc func returnIndexPath(_ sender: Any) -> Int {
    let contentView = (sender as AnyObject).superview
    let cell = contentView??.superview as! CellCustom
    let index = mainCollectionView.indexPath(for: cell)!.item
    print(index as Any)
    return index
    }
}


extension MainPageViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  postTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellCustom", for: indexPath) as?
                CellCustom else {
            return UICollectionViewCell()
        }
        let title = postTitles[indexPath.item]
        //let imageName = postImgNames[indexPath.item]
        
        cell.postTitles.text = title
        //cell.postImgNames.image = UIImage(named: imageName)
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedCell = postTitles[indexPath.item]
        print("\(selectedCell)이 클릭됨")
               
        
        
          
    }
    
    
    
    
}
/*------------------- 컬렉션뷰 레이아웃 ----------------*/
extension MainPageViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let interItemSpacing: CGFloat = 10
        let padding: CGFloat = 16
        let width = (collectionView.bounds.width - interItemSpacing * 3 - padding * 2) / 3
        print(width)
        let height = width * 1.5
        return CGSize(width: width, height: height)
    }
}


/*----writing에서 postTitles & postImages 받을 프로토콜 기능- */
extension MainPageViewController: AddingDataForCell {
    func addingDataForCell(_ title: String) {
        postTitles.append(title)
        mainCollectionView.reloadData()
        
    }
}
