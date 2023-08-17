//
//  EditProfileViewController.swift
//  nagaGrinGirinGrim
//

import UIKit

class EditProfileViewController: UIViewController {
    // MARK: Properties
    
    var userInfoTitles: [String] = ["이름", "나이", "직업"]
    
 
    
    // MARK: UI
    
    
    lazy var leftButton: UIBarButtonItem = {
        let leftButton = UIBarButtonItem(title: "취소", style: .plain, target: self, action:  #selector(buttonPressed(_:)))
        leftButton.tag = 1
        return leftButton
    }()
    
    lazy var rightButton: UIBarButtonItem = {
        let rightButton = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(buttonPressed(_:)))
        rightButton.tag = 2
        
        return rightButton
    }()
    
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

    
    let profilePictureView: UIStackView = {
        let profilePictureView = UIStackView()
        profilePictureView.axis = .vertical
        profilePictureView.translatesAutoresizingMaskIntoConstraints = false
        profilePictureView.backgroundColor = UIColor(hex: "ff9f1c")
        //        profilePictureView.layer.borderWidth = 1.0
        return profilePictureView
    }()
    
    let profileImage: UIImageView = {
        let profileImage = UIImageView()
        profileImage.image = UIImage(systemName: "scribble")
        profileImage.backgroundColor = UIColor.white
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.layer.cornerRadius = 50
        return profileImage
    }()
    
    let profilImageEditButton: UIButton = {
        let profilImageEditButton = UIButton()
        profilImageEditButton.setTitle("사진 수정", for: .normal)
        profilImageEditButton.setTitleColor(UIColor(hex: "187afe"), for: .normal)
        profilImageEditButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        
        //        profilImageEditButton.backgroundColor = UIColor.white
        profilImageEditButton.translatesAutoresizingMaskIntoConstraints = false
        return profilImageEditButton
    }()
    
    
    
    let userInfoView: UIStackView = {
        let userInfoView = UIStackView()
        userInfoView.axis = .vertical
        userInfoView.translatesAutoresizingMaskIntoConstraints = false
        userInfoView.backgroundColor = UIColor(hex: "cbf3f0")
        //        userInfoView.layer.borderWidth = 1.0
        return userInfoView
    }()
    
    
    let userInfoList = ["이름","기분","소개","기념일"]


  
        
 
    
   

    
    
    let otherButtonView: UIView = {
        let otherButtonView = UIView()
        otherButtonView.translatesAutoresizingMaskIntoConstraints = false
        otherButtonView.backgroundColor = UIColor(hex: "2ec4b6")
        //        otherButtonView.layer.borderWidth = 1.0
        return otherButtonView
    }()
    
    
//MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
           configeUI()
        
    }
}

//MARK: configure UI
extension EditProfileViewController{
    func configeUI(){
        self.navigationItem.leftBarButtonItem = self.leftButton
        self.navigationItem.rightBarButtonItem = self.rightButton
        self.view.addSubview(bodyContainer)
        bodyContainer.addSubview(profilePictureView)
        bodyContainer.addSubview(userInfoView)
        bodyContainer.addSubview(otherButtonView)
        profilePictureView.addSubview(profileImage)
        profilePictureView.addSubview(profilImageEditButton)
//        userInfoView.addSubview(userInfoBox)
//        userInfoBox.addSubview(userInfoTitle)
//        userInfoBox.addSubview(userInfoTextField)

        useInfoList()

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
        
        
        
        let imageSize = childrenHeight * 0.5
        NSLayoutConstraint.activate([
            profileImage.centerXAnchor.constraint(equalTo: profilePictureView.centerXAnchor),
            profileImage.centerYAnchor.constraint(equalTo: profilePictureView.centerYAnchor),
            profileImage.widthAnchor.constraint(equalToConstant: imageSize),
            profileImage.heightAnchor.constraint(equalToConstant: imageSize),
        ])
        
        let buttonSize = childrenHeight * 0.2
        NSLayoutConstraint.activate([
            profilImageEditButton.centerXAnchor.constraint(equalTo: profilePictureView.centerXAnchor),
            profilImageEditButton.heightAnchor.constraint(equalToConstant: buttonSize),
            profilImageEditButton.bottomAnchor.constraint(equalTo: profilePictureView.bottomAnchor,constant: -5)
            
        ])
        
        NSLayoutConstraint.activate([
            userInfoView.leadingAnchor.constraint(equalTo: bodyContainer.leadingAnchor,constant: 0),
            userInfoView.trailingAnchor.constraint(equalTo: bodyContainer.trailingAnchor,constant: 0),
            userInfoView.centerYAnchor.constraint(equalTo: bodyContainer.centerYAnchor),
            userInfoView.heightAnchor.constraint(equalToConstant: childrenHeight)
            
        ])
        
//        NSLayoutConstraint.activate([
//            userInfoBox.leadingAnchor.constraint(equalTo: userInfoView.leadingAnchor, constant: 10),
//            userInfoBox.trailingAnchor.constraint(equalTo: userInfoView.trailingAnchor, constant: -10),
//            userInfoBox.topAnchor.constraint(equalTo: userInfoView.topAnchor, constant: 10),
//            userInfoBox.heightAnchor.constraint(equalToConstant: 25)
//        ])
//
//        NSLayoutConstraint.activate([
//            userInfoTitle.leadingAnchor.constraint(equalTo: userInfoBox.leadingAnchor, constant: 0),
//            userInfoTitle.widthAnchor.constraint(equalToConstant: 100),
//            userInfoTitle.centerYAnchor.constraint(equalTo: userInfoBox.centerYAnchor)
//        ])
//
//        NSLayoutConstraint.activate([
//            userInfoTextField.leadingAnchor.constraint(equalTo: userInfoTitle.trailingAnchor,constant: 10),
//            userInfoTextField.trailingAnchor.constraint(equalTo: userInfoBox.trailingAnchor, constant: 0)
//        ])
//
        
        
        NSLayoutConstraint.activate([
            otherButtonView.leadingAnchor.constraint(equalTo: bodyContainer.leadingAnchor,constant: 0),
            otherButtonView.trailingAnchor.constraint(equalTo: bodyContainer.trailingAnchor,constant: 0),
            otherButtonView.bottomAnchor.constraint(equalTo: bodyContainer.bottomAnchor,constant: 0),
            otherButtonView.heightAnchor.constraint(equalToConstant: childrenHeight)
            
        ])
    }
}
    
    
//MARK: method
extension EditProfileViewController{
    
    func useInfoList (){
        for info in userInfoList {
            let userInfoBox: UIStackView = {
                let userInfoBox = UIStackView()
                userInfoBox.axis = .horizontal
                userInfoBox.translatesAutoresizingMaskIntoConstraints = false
                userInfoBox.layer.borderColor = UIColor.gray.cgColor
                userInfoBox.layer.borderWidth = 1
                
                return userInfoBox
            }()
            
            let userInfoTitle: UILabel = {
                let userInfoTitle = UILabel()
                userInfoTitle.text = info
                userInfoTitle.textColor = UIColor.black
                userInfoTitle.backgroundColor = UIColor.white
                userInfoTitle.translatesAutoresizingMaskIntoConstraints = false
                return userInfoTitle
            }()
            
            
            let userInfoTextField : UITextField = {
                let userInfotextField = UITextField()
                userInfotextField.placeholder = "Enter Here"
                userInfotextField.backgroundColor = UIColor.white
                userInfotextField.translatesAutoresizingMaskIntoConstraints = false
                return userInfotextField
            }()
            userInfoBox.addArrangedSubview(userInfoTitle)
            userInfoBox.addArrangedSubview(userInfoTextField)
            userInfoView.addArrangedSubview(userInfoBox)
        }
    }
    
    
    @objc private func buttonPressed(_ sender: Any) {
        if let button = sender as? UIBarButtonItem {
            switch button.tag {
            case 1:
                navigationController?.popViewController(animated: true)
            case 2:
                if let collectionViewController = UIStoryboard(name: "CollectionViewTry", bundle: nil).instantiateViewController(withIdentifier: "CollectionViewTry") as? CollectionViewTry {
                     navigationController?.pushViewController(collectionViewController, animated: true)
                 }
            default:
                print("error")
            }
        }
    }
}

//살아남게해주세요 ..
//제발 ..
//gogo
