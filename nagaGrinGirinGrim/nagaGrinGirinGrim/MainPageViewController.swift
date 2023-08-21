//
//  MainPageViewController.swift
//  nagaGrinGirinGrim
//
//  Created by 철우 on 2023/08/14.
//

import UIKit

class MainPageViewController: UIViewController {
    let userData = UserData.shared
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    @IBAction func resetUserDefaultsValue(_ sender: Any) {
        userData.resetDefaults()
        mainCollectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPostData()
        view.addSubview(collectionView)
        
        // naviagation bar hidden
        self.navigationController?.isNavigationBarHidden = true
        
        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
        
/*--------------------------컬렉션뷰 레이아웃---------------------------*/
        if let flowlayout = mainCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {flowlayout.estimatedItemSize = .zero}
        mainCollectionView.contentInset = UIEdgeInsets(top: 8, left: 5, bottom: 8, right: 5)
/*-------------------------------------------------------------------*/
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mainCollectionView.reloadData()
    }
}

extension MainPageViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return defaults.array(forKey: "postTitles")?.count ?? userData.postTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.item
        defaults.set(index, forKey: "current")
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellCustom", for: indexPath) as?
                CellCustom else {
            return UICollectionViewCell()
        }
        
        let postTitles = (defaults.array(forKey: "postTitles") ?? userData.postTitles)
        let postImgNames = (defaults.array(forKey: "postImgNames") ?? userData.postImgNames)
                
        cell.postTitles.text = postTitles[indexPath.item] as? String
        cell.postImgNames.image = UIImage(named: postImgNames[indexPath.item] as! String)
        
        // cell 꾸미기
        viewLayout(cell)
        cell.backgroundColor = .white
        
        // postCard 꾸미기
        cell.postCard.backgroundColor = UIColor(cgColor: CGColor(red: 255, green: 255, blue: 255, alpha: 0.5))
        viewLayout(cell.postCard)
        
        return cell
    }
    
    func loadPostData() {
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellCustom", for: indexPath) as?
                    CellCustom else {
                return UICollectionViewCell()
            }
            let postTitles = (defaults.array(forKey: "postTitles") ?? userData.postTitles)
            let postImgNames = (defaults.array(forKey: "postImgNames") ?? userData.postImgNames)
                    
            cell.postTitles.text = postTitles[indexPath.item] as? String
            cell.postImgNames.image = UIImage(named: postImgNames[indexPath.item] as! String)
            
            // cell 꾸미기
            viewLayout(cell)
            cell.backgroundColor = .white
            
            // postCard 꾸미기
            cell.postCard.backgroundColor = UIColor(cgColor: CGColor(red: 255, green: 255, blue: 255, alpha: 0.5))
            viewLayout(cell.postCard)
            return cell
        }
    }
    func viewLayout(_ view: UIView) {
        view.layer.cornerRadius = 30
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowOpacity = 0.3
        view.layer.shadowRadius = 10
    }
    
}
/*------------------- 컬렉션뷰 레이아웃 ----------------*/
extension MainPageViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let interItemSpacing: CGFloat = 10
    let width = (collectionView.bounds.width - interItemSpacing * 3) / 2
    let height = width
    return CGSize(width: width, height: height)
    }
}
