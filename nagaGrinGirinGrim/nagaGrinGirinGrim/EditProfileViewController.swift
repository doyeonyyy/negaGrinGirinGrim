//
//  EditProfileViewController.swift
//  nagaGrinGirinGrim
//
//  Created by 보경 on 2023/08/14.
//

import UIKit

class EditProfileViewController: UIViewController {

// MARK: UI
    let bodyContainer: UIStackView = {
        //verticalStackView의 사용방법... !
       let bodyContainer = UIStackView()
        bodyContainer.axis = .vertical
        bodyContainer.translatesAutoresizingMaskIntoConstraints = false
        bodyContainer.backgroundColor = UIColor.yellow
        bodyContainer.layer.borderColor = UIColor.gray.cgColor
        bodyContainer.layer.borderWidth = 1.0
        return bodyContainer
    }()
    
    let profilePictureView: UIView = {
      let profilePictureView = UIView()
        profilePictureView.translatesAutoresizingMaskIntoConstraints = false
        profilePictureView.backgroundColor = UIColor.red
        return profilePictureView
        }()
    
    
    let userInfoView: UIView = {
        let userInfoView = UIView()
        userInfoView.translatesAutoresizingMaskIntoConstraints = false
        userInfoView.backgroundColor = UIColor.blue
        return userInfoView
    }()
    
    let otherButtonView: UIView = {
        let otherButtonView = UIView()
        otherButtonView.translatesAutoresizingMaskIntoConstraints = false
        otherButtonView.backgroundColor = UIColor.green
       return otherButtonView
    }()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        let backButton = UIBarButtonItem()
//        backButton.title = "뒤로 가기"
//        navigationItem.leftBarButtonItem = backButton
//        navigationItem.backBarButtonItem = backButton

            configeUI()
        
    }
}

//MARK: configure UI
    extension EditProfileViewController{
        func configeUI(){
            self.view.addSubview(bodyContainer)
            bodyContainer.addSubview(profilePictureView)
//            self.userInfoView.addSubview(userInfoView)
//            self.otherButtonView.addSubview(otherButtonView)
       setLayout()
        }
        
        func setLayout(){
            
            let screenWidth = UIScreen.main.bounds.width
            let screenHeight = UIScreen.main.bounds.height
            let desiredWidth = screenWidth * 0.8
            let desiredHeight = screenHeight * 0.65
           NSLayoutConstraint.activate([
                self.bodyContainer.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                self.bodyContainer.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
                self.bodyContainer.widthAnchor.constraint(equalToConstant: desiredWidth),
                 self.bodyContainer.heightAnchor.constraint(equalToConstant: desiredHeight)
            ])
            
            NSLayoutConstraint.activate([
                profilePictureView.leadingAnchor.constraint(equalTo: bodyContainer.leadingAnchor, constant: 0),
                profilePictureView.trailingAnchor.constraint(equalTo: bodyContainer.trailingAnchor, constant: 0),
                profilePictureView.topAnchor.constraint(equalTo: bodyContainer.topAnchor, constant: 0),
                profilePictureView.heightAnchor.constraint(equalToConstant: 100)

            ])
            
            NSLayoutConstraint.activate([


            ])
            
            NSLayoutConstraint.activate([


            ])
        }
    }
