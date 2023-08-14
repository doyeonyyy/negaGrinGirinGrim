//
//  EditProfileViewController.swift
//  nagaGrinGirinGrim
//

import UIKit

class EditProfileViewController: UIViewController {

// MARK: UI
    let bodyContainer: UIStackView = {
        //verticalStackView의 사용방법... !
       let bodyContainer = UIStackView()
        bodyContainer.axis = .vertical
        bodyContainer.translatesAutoresizingMaskIntoConstraints = false
//        bodyContainer.backgroundColor = UIColor.yellow
        bodyContainer.layer.borderColor = UIColor.gray.cgColor
        bodyContainer.layer.borderWidth = 1.0
        return bodyContainer
    }()
    
    let profilePictureView: UIView = {
      let profilePictureView = UIView()
        profilePictureView.translatesAutoresizingMaskIntoConstraints = false
        profilePictureView.backgroundColor = UIColor(hex: "ff9f1c")
        profilePictureView.layer.borderWidth = 1.0
        return profilePictureView
        }()
    
    
    let userInfoView: UIView = {
        let userInfoView = UIView()
        userInfoView.translatesAutoresizingMaskIntoConstraints = false
        userInfoView.backgroundColor = UIColor(hex: "cbf3f0")
        userInfoView.layer.borderWidth = 1.0
        return userInfoView
    }()
    
    let otherButtonView: UIView = {
        let otherButtonView = UIView()
        otherButtonView.translatesAutoresizingMaskIntoConstraints = false
        otherButtonView.backgroundColor = UIColor(hex: "2ec4b6")
        otherButtonView.layer.borderWidth = 1.0
       return otherButtonView
    }()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
            configeUI()
        
    }
}

//MARK: configure UI
    extension EditProfileViewController{
        func configeUI(){
            self.view.addSubview(bodyContainer)
            bodyContainer.addSubview(profilePictureView)
            bodyContainer.addSubview(userInfoView)
            bodyContainer.addSubview(otherButtonView)
            
       setLayout()
        }
        
        func setLayout(){
            
            let screenWidth = UIScreen.main.bounds.width
            let screenHeight = UIScreen.main.bounds.height
            let bodyContainerWidth = screenWidth * 0.8
            let bodyContainerHeight = screenHeight * 0.65
           NSLayoutConstraint.activate([
                self.bodyContainer.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                self.bodyContainer.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
                self.bodyContainer.widthAnchor.constraint(equalToConstant: bodyContainerWidth),
                 self.bodyContainer.heightAnchor.constraint(equalToConstant: bodyContainerHeight)
            ])
            
            let childrenHeight = bodyContainerHeight * 0.3

            NSLayoutConstraint.activate([
                profilePictureView.leadingAnchor.constraint(equalTo: bodyContainer.leadingAnchor, constant: 0),
                profilePictureView.trailingAnchor.constraint(equalTo: bodyContainer.trailingAnchor, constant: 0),
                profilePictureView.topAnchor.constraint(equalTo: bodyContainer.topAnchor, constant: 0),
                profilePictureView.heightAnchor.constraint(equalToConstant: childrenHeight)

            ])
            
            NSLayoutConstraint.activate([
                userInfoView.leadingAnchor.constraint(equalTo: bodyContainer.leadingAnchor,constant: 0),
                userInfoView.trailingAnchor.constraint(equalTo: bodyContainer.trailingAnchor,constant: 0),
                userInfoView.centerYAnchor.constraint(equalTo: bodyContainer.centerYAnchor),
                userInfoView.heightAnchor.constraint(equalToConstant: childrenHeight)

            ])
            
            NSLayoutConstraint.activate([
                otherButtonView.leadingAnchor.constraint(equalTo: bodyContainer.leadingAnchor,constant: 0),
                otherButtonView.trailingAnchor.constraint(equalTo: bodyContainer.trailingAnchor,constant: 0),
                otherButtonView.bottomAnchor.constraint(equalTo: bodyContainer.bottomAnchor,constant: 0),
                otherButtonView.heightAnchor.constraint(equalToConstant: childrenHeight)

            ])
        }
    }
