//
//  EditProfileViewController.swift
//  nagaGrinGirinGrim
//

import UIKit

class EditProfileViewController: UIViewController {
    // MARK: Properties
    var dataSourceArray: [String] = []
    
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
    
    
    
    let userInfoView: UIView = {
        let userInfoView = UIView()
        userInfoView.translatesAutoresizingMaskIntoConstraints = false
        userInfoView.backgroundColor = UIColor(hex: "cbf3f0")
        //        userInfoView.layer.borderWidth = 1.0
        return userInfoView
    }()
    
    let userInfoCollectionView : UICollectionView = {
        let flowlayOut = UICollectionViewFlowLayout()
        flowlayOut.scrollDirection = .vertical
        flowlayOut.minimumInteritemSpacing = 10     // Adjust the spacing between columns
        flowlayOut.minimumLineSpacing = 10  // Adjust the spacing between rows
        
        // Calculate the item size based on the desired number of rows and columns
        let numberOfColumns: CGFloat = 2
        let itemWidth = (UIScreen.main.bounds.width - (numberOfColumns - 1) * flowlayOut.minimumInteritemSpacing) / numberOfColumns
        flowlayOut.itemSize = CGSize(width: itemWidth, height: itemWidth) // Make square cells
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowlayOut)
        collectionView.backgroundColor = UIColor(hex:"bde0fe")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
  
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        return collectionView
    }()
    
    let titleLabel : UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "제목"
        titleLabel.backgroundColor = UIColor.blue
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    let inputTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Here"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
//    let sendButton : UIButton = {
//        let sendButton = UIButton()
//        sendButton.setTitle("Send", for: .normal)
//        sendButton.setTitleColor(.systemBlue, for: .normal)
//        sendButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
////        button.addTarget(self, action: #selector(selectBtn), for: .touchUpInside)
//        sendButton.translatesAutoresizingMaskIntoConstraints = false
//        return sendButton
//    }()
    
    
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
        
        dataSourceArray = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6"]
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
        userInfoView.addSubview(userInfoCollectionView)
//        chatcollectionView.dataSource = self
//            chatcollectionView.delegate = self
        userInfoCollectionView.addSubview(titleLabel)
        userInfoCollectionView.addSubview(inputTextField)
//        userInfoCollectionView.addSubview(sendButton)
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
        
        
        //컬렉션뷰
        NSLayoutConstraint.activate([
            userInfoCollectionView.leadingAnchor.constraint(equalTo: userInfoView.leadingAnchor,constant: 0),
            userInfoCollectionView.trailingAnchor.constraint(equalTo: userInfoView.trailingAnchor,constant: 0),
            userInfoCollectionView.topAnchor.constraint(equalTo: userInfoView.topAnchor,constant: 0),
            userInfoCollectionView.bottomAnchor.constraint(equalTo: userInfoView.bottomAnchor,constant: 0),
            
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.trailingAnchor.constraint(equalTo: userInfoView.trailingAnchor,constant: 0),
            titleLabel.topAnchor.constraint(equalTo: userInfoView.topAnchor,constant: 0),
            titleLabel.bottomAnchor.constraint(equalTo: userInfoView.bottomAnchor,constant: 0),
            titleLabel.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        
       
//        NSLayoutConstraint.activate([
//            sendButton.trailingAnchor.constraint(equalTo: userInfoView.trailingAnchor,constant: 0),
//            sendButton.topAnchor.constraint(equalTo: userInfoView.topAnchor,constant: 0),
//            sendButton.bottomAnchor.constraint(equalTo: userInfoView.bottomAnchor,constant: 0),
//            sendButton.widthAnchor.constraint(equalToConstant: 100)
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

extension EditProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSourceArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
              
        if let label = cell.contentView.subviews.first as? UILabel {
              label.text = dataSourceArray[indexPath.item]
          }
          
          // 셀의 배경색 설정
          cell.backgroundColor = .white
          
          return cell
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
}


