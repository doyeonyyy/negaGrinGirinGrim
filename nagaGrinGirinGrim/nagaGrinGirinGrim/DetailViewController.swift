//
//  DetailViewController.swift
//  nagaGrinGirinGrim
//
//  Created by 보경 on 2023/08/14.
//

import UIKit

//MARK: - 오늘 작업 내용 정리
/*
 🔥 기능면
 ~~1. swipe 기능 재적용~~
 2. 데이터 호출 방식 변경
 3. 이모지 연결 코드 작성
 4. back 버튼 적용
 5. 공유 및 다운로드 share sheet 연결부 변경
 
 🔥 UI면
 ~~1. UI constraint 잡기~~
 2. 타이틀 레이블 변경
 3. 허해보이는 View(메시지 란) UIView 적용
 4. 전체적인 T&M 통일 진행

 */
 
class DetailViewController: UIViewController {
    
    @IBOutlet weak var postedImage: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var profileName: UILabel!
    
    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var reactionButton: UIButton!
    @IBOutlet weak var countTracker: UILabel!
    @IBOutlet weak var detailDateLabel: UILabel!
    @IBOutlet weak var detailBodyLabel: UILabel!
    
    @IBOutlet weak var firstEmoji: UIButton!
    @IBOutlet weak var secondEmoji: UIButton!
    @IBOutlet weak var thirdEmoji: UIButton!
    @IBOutlet weak var fourthEmoji: UIButton!
    
    var reactionCollection: [String: Int] = [:]
    var firstReactionCount = 0
    var secondReactionCount = 0
    var thirdReactionCount = 0
    var fourthReactionCount = 0
    
    var imageIndex = 0
    var currentImageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        postedImage.isUserInteractionEnabled = true
        
        enableSwipe()
        // 이모지 라벨 수치 변경
        let emojiCount = reactionCollection.values
//        let calculate = emojiCount.reduce(0, {$0 + $1})
//        emojiTracker.text = String(calculate) //String(emojiCount.reduce(0){$0 + $1})
        
        // 이모지 세팅
        reactionButton.setTitle("", for: .normal)
        
        // 이미지 뷰 클릭 액션
        let profileImageTapped = UITapGestureRecognizer(target: self, action: #selector(profileImageTapped))
        profileImage.isUserInteractionEnabled = true
        profileImage.addGestureRecognizer(profileImageTapped)
    }

    func setupUI() {
        setupImages()
        setupReactionButtons()
        populateData()
        setupButtons()
        setupView()
    }
    
    func setupImages() {
        setUpProfileImage()
        setupPostImage()
    }
    
    func setUpProfileImage() {
        profileImage.image = UIImage(named: "earth")
    }
    
    func setupPostImage() {
        postedImage.image = UIImage(named: UserData.shared.postImgNames[currentImageIndex])
        postedImage.backgroundColor = .white
        postedImage.layer.cornerRadius = 30
        postedImage.layer.borderWidth = 2
        postedImage.layer.borderColor = UIColor.black.cgColor
        postedImage.layer.shadowOffset = CGSize(width: 0, height: 0)
        postedImage.contentMode = .scaleToFill
        postedImage.layer.shadowOpacity = 0.3
        postedImage.layer.shadowRadius = 10
    }
    
    func setupReactionButtons() {
        let emojiSet = ["🫠","🔥","❤️","⭐️"]
        
        [firstEmoji, secondEmoji, thirdEmoji, fourthEmoji].forEach { button in
            button?.setTitle(emojiSet[0], for: .normal)
            button?.layer.cornerRadius = 15
            button?.layer.borderWidth = 2
            button?.layer.borderColor = UIColor.black.cgColor
            button?.backgroundColor = .gray
        }
    }
    
    func populateData() {
        detailTitleLabel.text = UserData.shared.postTitles[0]
        detailBodyLabel.text = UserData.shared.postContents[0]
        detailDateLabel.text = UserData.shared.postDates[0]
        detailDateLabel.font = UIFont(name: detailDateLabel.font.fontName, size: 12)
    }
    
    func setupButtons() {
        editButton.setImage(UIImage(systemName: "ellipsis.circle"), for: .normal)
        editButton.setTitle("", for: .normal)
    }
    
    func setupView() {
        pageControl.numberOfPages = UserData.shared.postImgNames.count
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .lightGray
    }
    
    func enableSwipe() {
        // 스와이프 기능 구현
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipe))
        swipeLeft.direction = .left
        postedImage.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipe))
        swipeRight.direction = .right
        postedImage.addGestureRecognizer(swipeRight)
    }
    
    
    @IBAction func pageChanged(_ sender: UIPageControl) {
        postedImage.image = UIImage(named: UserData.shared.postImgNames[sender.currentPage])
    }
    
    @objc func shareButtonTapped() {
        print("오른쪽 버튼이 눌렸습니다.")
        guard let image = postedImage.image else { return }
        let shareSheetVC = UIActivityViewController(activityItems: [image],
                                                    applicationActivities: nil)
        present(shareSheetVC, animated: true)
    }
    
    @objc func profileImageTapped() {
        print("이미지가 눌렸습니다.")
        let ProfileViewControllerID = UIStoryboard(name: "Main", bundle: .none).instantiateViewController(identifier: "profileViewControllerID") as! ProfileViewController
        navigationController?.pushViewController(ProfileViewControllerID, animated: true)
    }
    
    
    
    @IBAction func EmojiButtonTapped(_ sender: UIButton) {
        
        switch sender {
        case firstEmoji: print("첫번째 버튼이 눌렸습니다.")
            let reaction = "🫠"
            firstReactionCount += 1
            reactionCollection.updateValue(firstReactionCount, forKey: reaction)
            let emojiString = reactionCollection.keys.joined(separator: "")
            reactionButton.setTitle(emojiString, for: .normal)
            
        case secondEmoji: print("두번째 버튼이 눌렸습니다.")
            let reaction = "🔥"
            secondReactionCount += 1
            reactionCollection.updateValue(secondReactionCount, forKey: reaction)
            let emojiString = reactionCollection.keys.joined(separator: "")
            reactionButton.setTitle(emojiString, for: .normal)
            
        case thirdEmoji: print("세번째 버튼이 눌렸습니다.")
            let reaction = "❤️"
            thirdReactionCount += 1
            reactionCollection.updateValue(thirdReactionCount, forKey: reaction)
            let emojiString = reactionCollection.keys.joined(separator: "")
            reactionButton.setTitle(emojiString, for: .normal)
            
        case fourthEmoji: print("네번째 버튼이 눌렸습니다.")
            let reaction = "⭐️"
            fourthReactionCount += 1
            reactionCollection.updateValue(fourthReactionCount, forKey: reaction)
            let emojiString = reactionCollection.keys.joined(separator: "")
            reactionButton.setTitle(emojiString, for: .normal)
        //에러 처리 필요
        default: print("에러가 발생했습니다.")
        }
    }
    
    @IBAction func reactionButtonClicked(_ sender: UIButton) {
//        let modalViewController = ModalViewController()
//        modalViewController.view.backgroundColor = .yellow
//        modalViewController.modalPresentationStyle = .pageSheet
//
//        if let sheet = modalViewController.sheetPresentationController {
//            sheet.detents = [.medium(), .large()]
//            sheet.delegate = self
//            sheet.prefersGrabberVisible = true
//        }
//
//        present(modalViewController, animated: true)
    }
    
    @objc func respondToSwipe(_ gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case .left:
                print("오른쪽으로 이동")
                imageIndex = (imageIndex + 1) % UserData.shared.postImgNames.count
                postedImage.image = UIImage(named: UserData.shared.postImgNames[imageIndex])

            case .right:
                print("왼쪽으로 이동")
                imageIndex = (imageIndex - 1 + UserData.shared.postImgNames.count) % UserData.shared.postImgNames.count
                postedImage.image = UIImage(named: UserData.shared.postImgNames[imageIndex])

            default:
                print("오류 발생")
            }
            postedImage.image = UIImage(named: UserData.shared.postImgNames[imageIndex])
            pageControl.currentPage = imageIndex
        }
    }
}

extension DetailViewController: UISheetPresentationControllerDelegate {
}
