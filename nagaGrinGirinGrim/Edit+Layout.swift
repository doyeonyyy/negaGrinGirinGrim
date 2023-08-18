////
////  Edit+Layout.swift
////  nagaGrinGirinGrim
////
////  Created by kiakim on 2023/08/16.
////
//
//import UIKit
//
//
////MARK: configure UI
//extension EditProfileViewController{
//    func configeUI(){
//        self.navigationItem.leftBarButtonItem = self.leftButton
//        self.navigationItem.rightBarButtonItem = self.rightButton
//        self.view.addSubview(bodyContainer)
//        bodyContainer.addSubview(profilePictureView)
//        bodyContainer.addSubview(userInfoView)
//        bodyContainer.addSubview(otherButtonView)
//        profilePictureView.addSubview(profileImage)
//        profilePictureView.addSubview(profilImageEditButton)
//        userInfoView.addSubview(collectionViewSEP)
//
////        userInfoCollectionView.addSubview(titleLabel)
////        userInfoCollectionView.addSubview(inputTextField)
//
//        setLayout()
//    }
//    
//    func setLayout(){
//        
//        let screenWidth = UIScreen.main.bounds.width
//        let screenHeight = UIScreen.main.bounds.height
//        let bodyContainerWidth = screenWidth * 0.8
//        let bodyContainerHeight = screenHeight * 0.65
//        NSLayoutConstraint.activate([
//            self.bodyContainer.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            self.bodyContainer.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
//            self.bodyContainer.widthAnchor.constraint(equalToConstant: bodyContainerWidth),
//            self.bodyContainer.heightAnchor.constraint(equalToConstant: bodyContainerHeight)
//        ])
//        
//        let childrenHeight = bodyContainerHeight * 0.3
//        
//        NSLayoutConstraint.activate([
//            profilePictureView.leadingAnchor.constraint(equalTo: bodyContainer.leadingAnchor, constant: 0),
//            profilePictureView.trailingAnchor.constraint(equalTo: bodyContainer.trailingAnchor, constant: 0),
//            profilePictureView.topAnchor.constraint(equalTo: bodyContainer.topAnchor, constant: 0),
//            profilePictureView.heightAnchor.constraint(equalToConstant: childrenHeight)
//            
//        ])
//        
//        
//        
//        let imageSize = childrenHeight * 0.5
//        NSLayoutConstraint.activate([
//            profileImage.centerXAnchor.constraint(equalTo: profilePictureView.centerXAnchor),
//            profileImage.centerYAnchor.constraint(equalTo: profilePictureView.centerYAnchor),
//            profileImage.widthAnchor.constraint(equalToConstant: imageSize),
//            profileImage.heightAnchor.constraint(equalToConstant: imageSize),
//        ])
//        
//        let buttonSize = childrenHeight * 0.2
//        NSLayoutConstraint.activate([
//            profilImageEditButton.centerXAnchor.constraint(equalTo: profilePictureView.centerXAnchor),
//            profilImageEditButton.heightAnchor.constraint(equalToConstant: buttonSize),
//            profilImageEditButton.bottomAnchor.constraint(equalTo: profilePictureView.bottomAnchor,constant: -5)
//            
//        ])
//        
//        NSLayoutConstraint.activate([
//            userInfoView.leadingAnchor.constraint(equalTo: bodyContainer.leadingAnchor,constant: 0),
//            userInfoView.trailingAnchor.constraint(equalTo: bodyContainer.trailingAnchor,constant: 0),
//            userInfoView.centerYAnchor.constraint(equalTo: bodyContainer.centerYAnchor),
//            userInfoView.heightAnchor.constraint(equalToConstant: childrenHeight)
//            
//        ])
//        
//        
////        컬렉션뷰
//        NSLayoutConstraint.activate([
//            collectionViewSEP.leadingAnchor.constraint(equalTo: userInfoView.leadingAnchor,constant: 0),
//            collectionViewSEP.trailingAnchor.constraint(equalTo: userInfoView.trailingAnchor,constant: 0),
//            collectionViewSEP.topAnchor.constraint(equalTo: userInfoView.topAnchor,constant: 0),
//            collectionViewSEP.bottomAnchor.constraint(equalTo: userInfoView.bottomAnchor,constant: 0),
//        ])
//        
////        NSLayoutConstraint.activate([
////            titleLabel.trailingAnchor.constraint(equalTo: userInfoView.trailingAnchor,constant: 0),
////            titleLabel.topAnchor.constraint(equalTo: userInfoView.topAnchor,constant: 0),
////            titleLabel.bottomAnchor.constraint(equalTo: userInfoView.bottomAnchor,constant: 0),
////            titleLabel.widthAnchor.constraint(equalToConstant: 100)
////        ])
//     
////        NSLayoutConstraint.activate([
////            sendButton.trailingAnchor.constraint(equalTo: userInfoView.trailingAnchor,constant: 0),
////            sendButton.topAnchor.constraint(equalTo: userInfoView.topAnchor,constant: 0),
////            sendButton.bottomAnchor.constraint(equalTo: userInfoView.bottomAnchor,constant: 0),
////            sendButton.widthAnchor.constraint(equalToConstant: 100)
////        ])
////
//        
//        
//        NSLayoutConstraint.activate([
//            otherButtonView.leadingAnchor.constraint(equalTo: bodyContainer.leadingAnchor,constant: 0),
//            otherButtonView.trailingAnchor.constraint(equalTo: bodyContainer.trailingAnchor,constant: 0),
//            otherButtonView.bottomAnchor.constraint(equalTo: bodyContainer.bottomAnchor,constant: 0),
//            otherButtonView.heightAnchor.constraint(equalToConstant: childrenHeight)
//            
//        ])
//    }
//}
