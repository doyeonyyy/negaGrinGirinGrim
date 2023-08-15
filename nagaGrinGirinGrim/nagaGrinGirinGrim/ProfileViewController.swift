//
//  ProfileViewController.swift
//  nagaGrinGirinGrim
//
//  Created by 보경 on 2023/08/14.
//




import UIKit
import Foundation

struct User {
    var profilePicture: String
    var name: String
    var mood: String
    var introduction : String
    var titleOfAnniversary : String
    var anniversary : String
}

let defaults = UserDefaults.standard

let defaultProfile = User(profilePicture: "two_zo_img", name: "⚡️에너자이조⚡️", mood: "🔥", introduction: "열쩡👍열쩡👍열쩡👍", titleOfAnniversary: "2조 결성일!", anniversary: "2023/07/31")

class ProfileViewController: UIViewController {


    @IBAction func editBtnAct(_ sender: Any) {
        let editProfileViewControllerID = UIStoryboard(name: "EditProfileStoryboard", bundle: .none).instantiateViewController(identifier: "editProfileViewControllerID") as! EditProfileViewController
        self.present(editProfileViewControllerID, animated: true, completion: nil)
    }
    @IBAction func setDefault(_ sender: Any) {
        print("click arrow btn")
        defaults.set(defaultProfile.profilePicture, forKey: "profilePicture")
        defaults.set(defaultProfile.name, forKey: "name")
        defaults.set(defaultProfile.mood, forKey: "mood")
        defaults.set(defaultProfile.introduction, forKey: "introduction")
        defaults.set(defaultProfile.titleOfAnniversary, forKey: "titleOfAnniversary")
        defaults.set(defaultProfile.anniversary, forKey: "anniversary")
        loading()
        self.view.reloadInputViews()
    }
    
    @IBOutlet weak var test: UILabel!
    
    @IBOutlet weak var myDiaryTable: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var resetBtn: UIButton!
    @IBOutlet weak var anniversaryLabel: UILabel!
    @IBOutlet weak var titleOfAnniversaryLabel: UILabel!
    @IBOutlet weak var introductionTextView: UITextView!
    @IBOutlet weak var moodLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    
    func loading() {
        let picName: String = defaults.string(forKey: "profilePicture")!
        print(picName)
        profileImg.image = UIImage(named: picName)
        profileImg.frame(forAlignmentRect: CGRect(x: 20, y: 110, width: 150, height: 150))
        
        // 둥근 모서리
        profileImg.layer.cornerRadius = 15
        profileImg.layer.shadowOffset = CGSize(width: 5, height: 5)
        profileImg.layer.shadowOpacity = 0.7
        profileImg.layer.shadowRadius = 5
        profileImg.layer.shadowColor = UIColor.gray.cgColor
        
        
        nameLabel.text! = defaults.string(forKey: "name") ?? "nil"
        moodLabel.text! = defaults.string(forKey: "mood") ?? "nil"
        introductionTextView.text! = defaults.string(forKey: "introduction") ?? "nil"
        titleOfAnniversaryLabel.text! = defaults.string(forKey: "titleOfAnniversary") ?? "nil"
        anniversaryLabel.text! = defaults.string(forKey: "anniversary") ?? "nil"
}

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        view.addSubview(scrollView)
        scrollView.addSubview(profileImg)
        loading()
    }

}
