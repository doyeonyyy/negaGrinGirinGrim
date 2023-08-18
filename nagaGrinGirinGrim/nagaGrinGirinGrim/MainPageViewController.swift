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
        "이사를 했어요",
        "가족과 피크닉",
        "수박으로 집을 만들면?",
        "우리 엄마가 최고야",
        "짝사랑은 힘들어요",
        "지구를 보호해야해요!",
        "현대미술 체험기",
        "윤슬"
    ]
    var postImgNames = [
        "tree",
        "rainbow",
        "house",
        "park",
        "watermelonhouse",
        "mymom",
        "heart",
        "earth",
        "modernart",
        "yoonseul"
    ]
/*--------------------------------*/
    
    
    
 
    
    
    @IBAction func cameraButton(_ sender: UIButton) {
        let camera = UIImagePickerController()
        camera.sourceType = .camera
        camera.allowsEditing = true
        camera.cameraDevice = .rear
        camera.cameraCaptureMode = .photo
        camera.delegate = self
        present(camera, animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
        
/*--------------------------컬렉션뷰 레이아웃---------------------------*/
        if let flowlayout = mainCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
        flowlayout.estimatedItemSize = .zero
            
        }
        mainCollectionView.contentInset = UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 16)
/*-------------------------------------------------------------------*/
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
                let imageName = postImgNames[indexPath.item]
                
                cell.postTitles.text = title
                cell.postImgNames.image = UIImage(named: imageName)
        
             
        return cell
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

extension MainPageViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

// class CellCustom: UICollectionViewCell {
//     @IBOutlet weak var postImgNames: UIImageView!
//     @IBOutlet weak var postTitles: UILabel!
//}
