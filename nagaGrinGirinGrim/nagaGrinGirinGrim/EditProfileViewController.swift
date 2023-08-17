//
//  EditProfileViewController.swift
//  nagaGrinGirinGrim
//

import UIKit



class EditProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // MARK: Properties
    
    var userInfoTitles: [String] = ["이름", "나이", "직업"]
    
    
    // MARK: UI
    
    let imageView = UIImageView()
    
    
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
//        bodyContainer.layer.borderColor = UIColor.gray.cgColor
//        bodyContainer.layer.borderWidth = 1.0
        return bodyContainer
    }()
    
    
    let profilePictureView: UIStackView = {
        let profilePictureView = UIStackView()
        profilePictureView.axis = .vertical
        profilePictureView.translatesAutoresizingMaskIntoConstraints = false
        //        profilePictureView.backgroundColor = UIColor(hex: "ff9f1c")
//        profilePictureView.layer.borderColor = UIColor.gray.cgColor
//        profilePictureView.layer.borderWidth = 1.0
        return profilePictureView
    }()
    
    let profileImage: UIImageView = {
        let profileImage = UIImageView()
        profileImage.image = UIImage(named: "dangdangs")
        profileImage.backgroundColor = UIColor.white
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        profileImage.layer.masksToBounds = true
        profileImage.layer.borderColor = UIColor.gray.cgColor
        profileImage.layer.borderWidth = 1.0
        return profileImage
    }()
    
    let profilImageEditButton: UIButton = {
        let profilImageEditButton = UIButton()
        profilImageEditButton.setTitle("사진 수정", for: .normal)
        profilImageEditButton.setTitleColor(UIColor(hex: "187afe"), for: .normal)
        profilImageEditButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        //        profilImageEditButton.backgroundColor = UIColor.white
        profilImageEditButton.translatesAutoresizingMaskIntoConstraints = false
        profilImageEditButton.addTarget(self, action: #selector(openAlbum), for: .touchUpInside)
        return profilImageEditButton
    }()
    
    
    
    let userInfoView: UIStackView = {
        let userInfoView = UIStackView()
        userInfoView.axis = .vertical
        userInfoView.translatesAutoresizingMaskIntoConstraints = false
        userInfoView.backgroundColor = UIColor(hex: "cbf3f0")
        userInfoView.layer.borderColor = UIColor.gray.cgColor
        userInfoView.layer.borderWidth = 1
        userInfoView.layer.cornerRadius = 10
                                          
                                          
      return userInfoView
    }()
    
    let userInfoBox1: UIStackView = {
        let userInfoBox = UIStackView()
        userInfoBox.axis = .horizontal
        userInfoBox.translatesAutoresizingMaskIntoConstraints = false
//        userInfoBox.layer.borderColor = UIColor.gray.cgColor
//        userInfoBox.layer.borderWidth = 1
        // border try
        //        userInfoBox.layer.addBorder([.bottom], color: UIColor.gray, width: 1.0)
        
        return userInfoBox
    }()
    let userInfoTitle1: UILabel = {
        let userInfoTitle = UILabel()
        userInfoTitle.text = "이름"
        userInfoTitle.textColor = UIColor.black
//        userInfoTitle.backgroundColor = UIColor.white
        userInfoTitle.translatesAutoresizingMaskIntoConstraints = false
        return userInfoTitle
    }()
    let userInfoTextField1 : UITextField = {
        let userInfotextField = UITextField()
        userInfotextField.placeholder = "이름"
//        userInfotextField.backgroundColor = UIColor.white
        userInfotextField.translatesAutoresizingMaskIntoConstraints = false
        userInfotextField.text = userInfoData.name
        return userInfotextField
    }()
    
    let userInfoBox2: UIStackView = {
        let userInfoBox = UIStackView()
        userInfoBox.axis = .horizontal
        userInfoBox.translatesAutoresizingMaskIntoConstraints = false
//        userInfoBox.layer.borderColor = UIColor.gray.cgColor
//        userInfoBox.layer.borderWidth = 1
        return userInfoBox
    }()
    let userInfoTitle2: UILabel = {
        let userInfoTitle = UILabel()
        userInfoTitle.text = "기분"
        userInfoTitle.textColor = UIColor.black
//        userInfoTitle.backgroundColor = UIColor.white
        userInfoTitle.translatesAutoresizingMaskIntoConstraints = false
        return userInfoTitle
    }()
    let userInfoTextField2 : UITextField = {
        let userInfotextField = UITextField()
        userInfotextField.placeholder = "기분"
//        userInfotextField.backgroundColor = UIColor.white
        userInfotextField.text = userInfoData.mood
        userInfotextField.translatesAutoresizingMaskIntoConstraints = false
        return userInfotextField
    }()
    
    let userInfoBox3: UIStackView = {
        let userInfoBox = UIStackView()
        userInfoBox.axis = .horizontal
        userInfoBox.translatesAutoresizingMaskIntoConstraints = false
//        userInfoBox.layer.borderColor = UIColor.gray.cgColor
//        userInfoBox.layer.borderWidth = 1
        return userInfoBox
    }()
    let userInfoTitle3: UILabel = {
        let userInfoTitle = UILabel()
        userInfoTitle.text = "소개"
        userInfoTitle.textColor = UIColor.black
//        userInfoTitle.backgroundColor = UIColor.white
        userInfoTitle.translatesAutoresizingMaskIntoConstraints = false
        return userInfoTitle
    }()
    let userInfoTextField3 : UITextField = {
        let userInfotextField = UITextField()
        userInfotextField.placeholder = "소개"
        userInfotextField.text = userInfoData.introduction
//        userInfotextField.backgroundColor = UIColor.white
        userInfotextField.translatesAutoresizingMaskIntoConstraints = false
        return userInfotextField
    }()
    
    let userInfoBox4: UIStackView = {
        let userInfoBox = UIStackView()
        userInfoBox.axis = .horizontal
        userInfoBox.translatesAutoresizingMaskIntoConstraints = false
//        userInfoBox.layer.borderColor = UIColor.gray.cgColor
//        userInfoBox.layer.borderWidth = 1
        return userInfoBox
    }()
    let userInfoTitle4: UILabel = {
        let userInfoTitle = UILabel()
        userInfoTitle.text = "기념일"
        userInfoTitle.textColor = UIColor.black
//        userInfoTitle.backgroundColor = UIColor.white
        userInfoTitle.translatesAutoresizingMaskIntoConstraints = false
        return userInfoTitle
    }()
    let userInfoTextField4 : UITextField = {
        let userInfotextField = UITextField()
        userInfotextField.placeholder = "기념일"
        userInfotextField.text = userInfoData.anniversaryTitle
//        userInfotextField.backgroundColor = UIColor.white
        userInfotextField.translatesAutoresizingMaskIntoConstraints = false
        return userInfotextField
    }()
    
    let userInfoBox5: UIStackView = {
        let userInfoBox = UIStackView()
        userInfoBox.axis = .horizontal
        userInfoBox.translatesAutoresizingMaskIntoConstraints = false
//        userInfoBox.layer.borderColor = UIColor.gray.cgColor
//        userInfoBox.layer.borderWidth = 1
        return userInfoBox
    }()
    let userInfoTitle5: UILabel = {
        let userInfoTitle = UILabel()
        userInfoTitle.text = "날짜"
        userInfoTitle.textColor = UIColor.black
//        userInfoTitle.backgroundColor = UIColor.white
        userInfoTitle.translatesAutoresizingMaskIntoConstraints = false
        return userInfoTitle
    }()
    let userInfoTextField5 : UITextField = {
        let userInfotextField = UITextField()
        userInfotextField.placeholder = "날짜"
        userInfotextField.text = userInfoData.anniversary
//        userInfotextField.backgroundColor = UIColor.white
        userInfotextField.translatesAutoresizingMaskIntoConstraints = false
        return userInfotextField
    }()
    
    
    
    
    let otherButtonView: UIStackView = {
        let otherButtonView = UIStackView()
        otherButtonView.axis = .vertical
        otherButtonView.translatesAutoresizingMaskIntoConstraints = false
//        otherButtonView.backgroundColor = UIColor(hex: "2ec4b6")
//        otherButtonView.layer.borderColor = UIColor.gray.cgColor
//        otherButtonView.layer.borderWidth = 1.0
        return otherButtonView
    }()
    
    let otherButton1 : UIButton = {
        let otherButton1 = UIButton()
        otherButton1.setTitle("프로페셔널 계정으로 전환", for: .normal)
        otherButton1.setTitleColor(UIColor(hex: "187afe"), for: .normal)
        otherButton1.translatesAutoresizingMaskIntoConstraints = false
//        otherButton1.backgroundColor = UIColor(hex: "187afe")
        otherButton1.contentHorizontalAlignment = .left
        otherButton1.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        return otherButton1
    }()
    
    let otherButton2 : UIButton = {
        let otherButton2 = UIButton()
        otherButton2.setTitle("개인정보 설정", for: .normal)
        otherButton2.setTitleColor(UIColor(hex: "187afe"), for: .normal)
        otherButton2.translatesAutoresizingMaskIntoConstraints = false
//        otherButton2.backgroundColor = UIColor(hex: "187afe")
        otherButton2.contentHorizontalAlignment = .left
        otherButton2.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        return otherButton2
    }()
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configeUI()
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
    }

}

//MARK: configure UI
extension EditProfileViewController{
    func configeUI(){
        title = "프로필 수정"
        self.navigationItem.leftBarButtonItem = self.leftButton
        self.navigationItem.rightBarButtonItem = self.rightButton
        self.view.addSubview(bodyContainer)
        bodyContainer.addSubview(profilePictureView)
        bodyContainer.addSubview(userInfoView)
        bodyContainer.addSubview(otherButtonView)
        profilePictureView.addSubview(profileImage)
        profilePictureView.addSubview(profilImageEditButton)
        userInfoView.addSubview(userInfoBox1)
        userInfoBox1.addSubview(userInfoTitle1)
        userInfoBox1.addSubview(userInfoTextField1)
        userInfoView.addSubview(userInfoBox2)
        userInfoBox2.addSubview(userInfoTitle2)
        userInfoBox2.addSubview(userInfoTextField2)
        userInfoView.addSubview(userInfoBox3)
        userInfoBox3.addSubview(userInfoTitle3)
        userInfoBox3.addSubview(userInfoTextField3)
        userInfoView.addSubview(userInfoBox4)
        userInfoBox4.addSubview(userInfoTitle4)
        userInfoBox4.addSubview(userInfoTextField4)
        userInfoView.addSubview(userInfoBox5)
        userInfoBox5.addSubview(userInfoTitle5)
        userInfoBox5.addSubview(userInfoTextField5)
        otherButtonView.addSubview(otherButton1)
        otherButtonView.addSubview(otherButton2)
    
        
        
        setLayout()
    }
    
  
    
    func setLayout(){
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let bodyContainerWidth = screenWidth * 0.8
        let bodyContainerHeight = screenHeight * 0.65
        let childrenHeight = bodyContainerHeight * 0.3
        let userInfoTitleSize = 80
        let imageSize = childrenHeight * 0.6
        let buttonSize = childrenHeight * 0.2
        
   
      
        NSLayoutConstraint.activate([
            self.bodyContainer.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.bodyContainer.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.bodyContainer.widthAnchor.constraint(equalToConstant: bodyContainerWidth),
            self.bodyContainer.heightAnchor.constraint(equalToConstant: bodyContainerHeight)
        ])
        
        
        
        NSLayoutConstraint.activate([
            profilePictureView.leadingAnchor.constraint(equalTo: bodyContainer.leadingAnchor, constant: 0),
            profilePictureView.trailingAnchor.constraint(equalTo: bodyContainer.trailingAnchor, constant: 0),
            profilePictureView.topAnchor.constraint(equalTo: bodyContainer.topAnchor, constant: 0),
            profilePictureView.heightAnchor.constraint(equalToConstant: childrenHeight)
            
        ])
        
        
        
       
        NSLayoutConstraint.activate([
            profileImage.centerXAnchor.constraint(equalTo: profilePictureView.centerXAnchor),

            profileImage.centerYAnchor.constraint(equalTo: profilePictureView.centerYAnchor),
            profileImage.widthAnchor.constraint(equalToConstant: imageSize),
            profileImage.heightAnchor.constraint(equalToConstant: imageSize),
        ])
        
       
        NSLayoutConstraint.activate([
            profilImageEditButton.centerXAnchor.constraint(equalTo: profilePictureView.centerXAnchor),
            profilImageEditButton.heightAnchor.constraint(equalToConstant: buttonSize),
            profilImageEditButton.bottomAnchor.constraint(equalTo: profilePictureView.bottomAnchor,constant: 0)
            
        ])
        
        NSLayoutConstraint.activate([
            userInfoView.leadingAnchor.constraint(equalTo: bodyContainer.leadingAnchor,constant: 0),
            userInfoView.trailingAnchor.constraint(equalTo: bodyContainer.trailingAnchor,constant: 0),
            userInfoView.topAnchor.constraint(equalTo: profilePictureView.bottomAnchor, constant: 30),
            userInfoView.heightAnchor.constraint(equalToConstant: bodyContainerHeight * 0.45)
            
        ])
        //Box1
        NSLayoutConstraint.activate([
            userInfoBox1.leadingAnchor.constraint(equalTo: userInfoView.leadingAnchor, constant: 10),
            userInfoBox1.trailingAnchor.constraint(equalTo: userInfoView.trailingAnchor, constant: -10),
            userInfoBox1.topAnchor.constraint(equalTo: userInfoView.topAnchor, constant: 10),
            userInfoBox1.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        
        NSLayoutConstraint.activate([
            userInfoTitle1.leadingAnchor.constraint(equalTo: userInfoBox1.leadingAnchor, constant: 0),
            userInfoTitle1.widthAnchor.constraint(equalToConstant: CGFloat(userInfoTitleSize)),
            userInfoTitle1.centerYAnchor.constraint(equalTo: userInfoBox1.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            userInfoTextField1.leadingAnchor.constraint(equalTo: userInfoTitle1.trailingAnchor,constant: 10),
            userInfoTextField1.trailingAnchor.constraint(equalTo: userInfoBox1.trailingAnchor, constant: 0),
            userInfoTextField1.centerYAnchor.constraint(equalTo: userInfoBox1.centerYAnchor)
            
        ])
        
        //Box2
        NSLayoutConstraint.activate([
            userInfoBox2.leadingAnchor.constraint(equalTo: userInfoView.leadingAnchor, constant: 10),
            userInfoBox2.trailingAnchor.constraint(equalTo: userInfoView.trailingAnchor, constant: -10),
            userInfoBox2.topAnchor.constraint(equalTo:userInfoBox1.bottomAnchor, constant: 10),
            userInfoBox2.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        NSLayoutConstraint.activate([
            userInfoTitle2.leadingAnchor.constraint(equalTo: userInfoBox2.leadingAnchor, constant: 0),
            userInfoTitle2.widthAnchor.constraint(equalToConstant: CGFloat(userInfoTitleSize)),
            userInfoTitle2.centerYAnchor.constraint(equalTo: userInfoBox2.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            userInfoTextField2.leadingAnchor.constraint(equalTo: userInfoTitle2.trailingAnchor,constant: 10),
            userInfoTextField2.trailingAnchor.constraint(equalTo: userInfoBox2.trailingAnchor, constant: 0),
            userInfoTextField2.centerYAnchor.constraint(equalTo: userInfoBox2.centerYAnchor)
        ])
        
        //Box3
        NSLayoutConstraint.activate([
            userInfoBox3.leadingAnchor.constraint(equalTo: userInfoView.leadingAnchor, constant: 10),
            userInfoBox3.trailingAnchor.constraint(equalTo: userInfoView.trailingAnchor, constant: -10),
            userInfoBox3.topAnchor.constraint(equalTo:userInfoBox2.bottomAnchor, constant: 10),
            userInfoBox3.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        NSLayoutConstraint.activate([
            userInfoTitle3.leadingAnchor.constraint(equalTo: userInfoBox3.leadingAnchor, constant: 0),
            userInfoTitle3.widthAnchor.constraint(equalToConstant: CGFloat(userInfoTitleSize)),
            userInfoTitle3.centerYAnchor.constraint(equalTo: userInfoBox3.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            userInfoTextField3.leadingAnchor.constraint(equalTo: userInfoTitle3.trailingAnchor,constant: 10),
            userInfoTextField3.trailingAnchor.constraint(equalTo: userInfoBox3.trailingAnchor, constant: 0),
            userInfoTextField3.centerYAnchor.constraint(equalTo: userInfoBox3.centerYAnchor)
        ])
        
        //Box4
        NSLayoutConstraint.activate([
            userInfoBox4.leadingAnchor.constraint(equalTo: userInfoView.leadingAnchor, constant: 10),
            userInfoBox4.trailingAnchor.constraint(equalTo: userInfoView.trailingAnchor, constant: -10),
            userInfoBox4.topAnchor.constraint(equalTo:userInfoBox3.bottomAnchor, constant: 10),
            userInfoBox4.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        NSLayoutConstraint.activate([
            userInfoTitle4.leadingAnchor.constraint(equalTo: userInfoBox4.leadingAnchor, constant: 0),
            userInfoTitle4.widthAnchor.constraint(equalToConstant: CGFloat(userInfoTitleSize)),
            userInfoTitle4.centerYAnchor.constraint(equalTo: userInfoBox4.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            userInfoTextField4.leadingAnchor.constraint(equalTo: userInfoTitle4.trailingAnchor,constant: 10),
            userInfoTextField4.trailingAnchor.constraint(equalTo: userInfoBox4.trailingAnchor, constant: 0),
            userInfoTextField4.centerYAnchor.constraint(equalTo: userInfoBox4.centerYAnchor)
        ])
        
        //Box5
        NSLayoutConstraint.activate([
            userInfoBox5.leadingAnchor.constraint(equalTo: userInfoView.leadingAnchor, constant: 10),
            userInfoBox5.trailingAnchor.constraint(equalTo: userInfoView.trailingAnchor, constant: -10),
            userInfoBox5.topAnchor.constraint(equalTo:userInfoBox4.bottomAnchor, constant: 10),
            userInfoBox5.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        NSLayoutConstraint.activate([
            userInfoTitle5.leadingAnchor.constraint(equalTo: userInfoBox5.leadingAnchor, constant: 0),
            userInfoTitle5.widthAnchor.constraint(equalToConstant: CGFloat(userInfoTitleSize)),
            userInfoTitle5.centerYAnchor.constraint(equalTo: userInfoBox5.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            userInfoTextField5.leadingAnchor.constraint(equalTo: userInfoTitle5.trailingAnchor,constant: 10),
            userInfoTextField5.trailingAnchor.constraint(equalTo: userInfoBox5.trailingAnchor, constant: 0),
            userInfoTextField5.centerYAnchor.constraint(equalTo: userInfoBox5.centerYAnchor)
            ])
        
        
        
        NSLayoutConstraint.activate([
            otherButtonView.leadingAnchor.constraint(equalTo: bodyContainer.leadingAnchor,constant: 0),
            otherButtonView.trailingAnchor.constraint(equalTo: bodyContainer.trailingAnchor,constant: 0),
            otherButtonView.topAnchor.constraint(equalTo: userInfoView.bottomAnchor,constant: 30),
            otherButtonView.heightAnchor.constraint(equalToConstant: bodyContainerHeight * 0.1)
            
        ])
        
        NSLayoutConstraint.activate([
            otherButton1.leadingAnchor.constraint(equalTo: otherButtonView.leadingAnchor, constant: 0),
            otherButton1.trailingAnchor.constraint(equalTo: otherButtonView.trailingAnchor, constant: 0),
        ])
        NSLayoutConstraint.activate([
            otherButton2.leadingAnchor.constraint(equalTo: otherButtonView.leadingAnchor, constant: 0),
            otherButton2.trailingAnchor.constraint(equalTo: otherButtonView.trailingAnchor, constant: 0),
            otherButton2.topAnchor.constraint(equalTo: otherButton1.bottomAnchor, constant: 5)
        ])
    }
}


//MARK: method
extension EditProfileViewController{
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
    
    @objc func openAlbum(){
        print("사진첩 열렸다!")
        let imagePicker = UIImagePickerController()
             imagePicker.delegate = self
             imagePicker.sourceType = .photoLibrary
             present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
          if let selectedImage = info[.originalImage] as? UIImage {
              profileImage.image = selectedImage
          }
          
          dismiss(animated: true, completion: nil)
      }
      
      func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
          dismiss(animated: true, completion: nil)
      }
}
