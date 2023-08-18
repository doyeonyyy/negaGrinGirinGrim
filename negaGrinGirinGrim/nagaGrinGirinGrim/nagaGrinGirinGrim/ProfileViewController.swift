//
//  ProfileViewController.swift
//  nagaGrinGirinGrim
//
//  Created by 보경 on 2023/08/14.
//

import UIKit
import Foundation

let defaults = UserDefaults.standard
let userData = UserData()


// 프로필 화면을 그리는 ViewController
// 데이터 이용: UserDefaults 값이 nil인 경우 UserData()의 dummy data 이용
class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // cell 개수 반환
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let postTitles = defaults.array(forKey: "postTitles") as? [String] ?? userData.postTitles
        return postTitles.count
    }
    
    // section 개수 반환
    func numberOfSections(in tableView: UITableView) -> Int {1}
    
    // section title
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {"나의 일기장"}
    
    // cell 내용 반환
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myDiaryTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyDiaryTableViewCell
        
        // cell card 인스턴스 생성 및 꾸미기
        let card = cell.cellCard
        card!.layer.cornerRadius = 30
        card!.backgroundColor = .white
        card!.layer.shadowOffset = CGSize(width: 0, height: 0)
        card!.layer.shadowOpacity = 0.3
        card!.layer.shadowRadius = 10
        
        let postTitles = defaults.array(forKey: "postTitles") as? [String] ?? userData.postTitles
        let postContents = defaults.array(forKey: "postTitles") as? [String] ?? userData.postContents
        let postImgNames = defaults.array(forKey: "postTitles") as? [String] ?? userData.postImgNames
        let postDates = defaults.array(forKey: "postTitles") as? [String] ?? userData.postDates
        
        cell.titleLable.text = postTitles[indexPath.row]
        cell.descriptLabel.text = postContents[indexPath.row]
        cell.dateLabel.text = postDates[indexPath.row]
        cell.postImage.image = UIImage(named: postImgNames[indexPath.row])
        cell.postImage.layer.cornerRadius = 30
        cell.postImage.layer.opacity = 0.5
        cell.layer.cornerRadius = 30
        
        return cell
    }
    
    // cell 높이 지정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {100}
    
    // cell header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "profileHeader")
            
        // profile box 꾸미기
        profileCard.layer.cornerRadius = 30
        profileCard.backgroundColor = .white
        profileCard.layer.shadowOffset = CGSize(width: 0, height: 0)
        profileCard.layer.shadowOpacity = 0.3
        profileCard.layer.shadowRadius = 10
            
        return header
    }
    
    // 프로필 편집 화면으로 이동
    @IBAction func goToEdit(_ sender: Any) {
        let editProfileViewControllerID = UIStoryboard(name: "EditProfileStoryboard", bundle: .none).instantiateViewController(identifier: "editProfileViewControllerID") as! EditProfileViewController)
        navigationController?.pushViewController(editProfileViewControllerID, animated: true)
    }
    
    // 스토리보드의 View들
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var profileCard: UIView!
    @IBOutlet weak var profileBox: UIView!
    @IBOutlet weak var myDiaryTable: UITableView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var anniversaryLabel: UILabel!
    @IBOutlet weak var titleOfAnniversaryLabel: UILabel!
    @IBOutlet weak var introductionTextView: UITextView!
    @IBOutlet weak var moodLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    
    func loadProfile() {
        
        // 프로필 사진과 사진 데이터 연결
        let picName: String = defaults.string(forKey: "profilePicture") ?? userData.profile.profilePicture
        print(picName)
        profileImg.image = UIImage(named: picName)
        
        // userName 글자 정리
        let userName: String = "@\(defaults.string(forKey: "userName") ?? userData.profile.userName!)님의 프로필"

        // 프로필 정보와 라벨 연결
        nameLabel.text! = defaults.string(forKey: "name") ?? userData.profile.name
        moodLabel.text! = defaults.string(forKey: "mood") ?? userData.profile.mood
        userNameLabel.text! = userName
        introductionTextView.text! = defaults.string(forKey: "introduction") ?? userData.profile.introduction
        titleOfAnniversaryLabel.text! = defaults.string(forKey: "titleOfAnniversary") ?? userData.profile.titleOfAnniversary
        anniversaryLabel.text! = defaults.string(forKey: "anniversary") ?? userData.profile.anniversary
}

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 테이블뷰에 HeaderFooterView 등록
        myDiaryTable.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "customHeader")
        
        // navigation bar hidden
        self.navigationController?.isNavigationBarHidden = true
        
        // subview 관계
        view.addSubview(myDiaryTable)
        myDiaryTable.addSubview(profileBox)
        profileBox.addSubview(profileCard)
        profileCard.addSubview(profileImg)
        
        // tableView의 delegate와 dataSource
        myDiaryTable.delegate = self
        myDiaryTable.dataSource = self
        
        // profile 정보 load
        loadProfile()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        defaults.set(index, forKey: "current")
        let detailViewControllerID = UIStoryboard(name: "DetailStoryboard", bundle: .none).instantiateViewController(identifier: "detailViewControllerID") as! DetailViewController
        self.navigationController?.isNavigationBarHidden = false
        navigationController?.pushViewController(detailViewControllerID, animated: true)
        print(defaults.integer(forKey: "current"))
    }
}


