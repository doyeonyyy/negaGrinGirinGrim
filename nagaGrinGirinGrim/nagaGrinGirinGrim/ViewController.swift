//
//  ViewController.swift
//  nagaGrinGirinGrim
//
//  Created by t2023-m0047 on 2023/08/14.
//

import UIKit

class ViewController: UIViewController {
    // 뷰 컨트롤러를 지워버렸을 때는 아래와 같이 다시 셋팅
    // let storyboardID = UIStoryboard(name: "className", bundle: .none).instantiateViewController(identifier: "storyboardID") as! className
    // navigationController?.pushViewController(storyboardID, animated: true) - 원하는 presentation 방식 변경
    
    @IBAction func mainSegueAct(_ sender: Any) {
        let mainPageStoryboardID = UIStoryboard(name: "MainPageStoryboard", bundle: .none).instantiateViewController(identifier: "mainPageViewControllerID") as! MainPageViewController
        navigationController?.pushViewController(mainPageStoryboardID, animated: true)
    }
    @IBAction func detailSegueAct(_ sender: Any) {
        let detailViewControllerID = UIStoryboard(name: "DetailStoryboard", bundle: .none).instantiateViewController(identifier: "detailViewControllerID") as! DetailViewController
        navigationController?.pushViewController(detailViewControllerID, animated: true)
    }
    @IBAction func pofileSegueAct(_ sender: Any) {
        let profileViewControllerID = UIStoryboard(name: "ProfileStoryboard", bundle: .none).instantiateViewController(identifier: "profileViewControllerID") as! ProfileViewController
        navigationController?.pushViewController(profileViewControllerID, animated: true)
    }
    @IBAction func editProfileSegueAct(_ sender: Any) {
        let editProfileViewControllerID = UIStoryboard(name: "EditProfileStoryboard", bundle: .none).instantiateViewController(identifier: "editProfileViewControllerID") as! EditProfileViewController
        editProfileViewControllerID.title = "프로필 수정"
        navigationController?.pushViewController(editProfileViewControllerID, animated: true)
        
        
        
        
        
    }
    @IBAction func writingSegueAct(_ sender: Any) {
        let writingViewControllerID = UIStoryboard(name: "WritingStoryboard", bundle: .none).instantiateViewController(identifier: "writingViewControllerID") as! WritingViewController
        navigationController?.pushViewController(writingViewControllerID, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    @objc func saveButtonTapped() {
        // This function will be called when the "Save" button is tapped
        // Add your save logic here
    }
    
    
}

