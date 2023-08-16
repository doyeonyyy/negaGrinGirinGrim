//
//  TabBarViewController.swift
//  nagaGrinGirinGrim
//
//  Created by 남보경 on 2023/08/16.
//

import UIKit




class TabBarViewController: UITabBarController {
       override func viewDidLoad() {
           super.viewDidLoad()
           
           
           // Do any additional setup after loading the view.
           let toMain = MainPageViewController()
           let toWrite = WritingViewController()
           let toProfile = ProfileViewController()
           
           //각 tab bar의 viewcontroller 타이틀 설정
           toMain.title = "홈 화면"
           toWrite.title = "포스트 작성"
           toProfile.title = "프로필"
           
           toMain.tabBarItem.image = UIImage.init(systemName: "house")
           toWrite.tabBarItem.image = UIImage.init(systemName: "pencil.line")
           toProfile.tabBarItem.image = UIImage.init(systemName: "person")
           
           //self.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0);
           
           // 위에 타이틀 text를 항상 크게 보이게 설정
           toMain.navigationItem.largeTitleDisplayMode = .always
           toWrite.navigationItem.largeTitleDisplayMode = .always
           toProfile.navigationItem.largeTitleDisplayMode = .always
           
           // navigationController의 root view 설정
           let navigationMain = UINavigationController(rootViewController: toMain)
           let navigationWriting = UINavigationController(rootViewController: toWrite)
           let navigationProfile = UINavigationController(rootViewController: toProfile)
           
       
           navigationMain.navigationBar.prefersLargeTitles = true
           navigationWriting.navigationBar.prefersLargeTitles = true
           navigationProfile.navigationBar.prefersLargeTitles = true
           
           setViewControllers([navigationMain, navigationWriting, navigationProfile], animated: false)
       }

       /*
        // MARK: - Navigation
        
        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        }
        */
       
   }
