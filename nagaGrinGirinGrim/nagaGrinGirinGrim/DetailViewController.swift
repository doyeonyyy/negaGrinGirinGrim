//
//  DetailViewController.swift
//  nagaGrinGirinGrim
//
//  Created by 보경 on 2023/08/14.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var postedImage: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var detailTitleLabel: UILabel!
<<<<<<< Updated upstream
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var editButton: UIButton!
=======
    @IBOutlet weak var reactionButton: UIButton!
>>>>>>> Stashed changes
    
    @IBOutlet weak var detailDateLabel: UILabel!
    @IBOutlet weak var detailBodyLabel: UILabel!
    
    @IBOutlet weak var emojiTracker: UILabel!
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
<<<<<<< Updated upstream
        setupView()
        postedImage.isUserInteractionEnabled = true
        
=======
        postedImage.isUserInteractionEnabled = true
        
        // 스와이프 기능 구현
>>>>>>> Stashed changes
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipe))
        swipeLeft.direction = .left
        postedImage.addGestureRecognizer(swipeLeft)
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipe))
        swipeRight.direction = .right
        postedImage.addGestureRecognizer(swipeRight)
        
<<<<<<< Updated upstream
    }
    
    func setupView() {
        pageControl.numberOfPages = postImgNames.count
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .lightGray
    }
    
=======
        // 이모지 라벨 수치 변경
        let emojiCount = reactionCollection.values
        let calculate = emojiCount.reduce(0, {$0 + $1})
        emojiTracker.text = String(calculate) //String(emojiCount.reduce(0){$0 + $1})
        
        // 이모지 세팅
        reactionButton.setTitle("", for: .normal)
        
        // 이미지 뷰 클릭 액션
        let profileImageTapped = UITapGestureRecognizer(target: self, action: #selector(profileImageTapped))
        profileImage.isUserInteractionEnabled = true
        profileImage.addGestureRecognizer(profileImageTapped)
    }
    
    func setupView() {
        pageControl.numberOfPages = UserData().postImgNames.count
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .lightGray
    }
    
>>>>>>> Stashed changes
    func setupUI() {
        setupImages()
        setupNavigationBarItem()
        setupReactionButtons()
        populateData()
<<<<<<< Updated upstream
        setupButtons()
=======
        setupView()
>>>>>>> Stashed changes
    }
    
    func populateData() {
        detailTitleLabel.text = UserData().postTitles[0]
        detailBodyLabel.text = UserData().postContents[0]
        detailDateLabel.text = UserData().postDates[0]
        detailDateLabel.font = UIFont(name: detailDateLabel.font.fontName, size: 12)
    }
    
    func setupImages() {
        // 프로필
        profileImage.image = UIImage(named: "earth")
        
        // 포스트 이미지
<<<<<<< Updated upstream
        postedImage.image = UIImage(named: postImgNames[currentImageIndex])
        postedImage.backgroundColor = .black
        postedImage.layer.cornerRadius = 15
    }
    
    func setupReactionButtons() {
        firstEmoji.layer.cornerRadius = 10
=======
        postedImage.image = UIImage(named: UserData().postImgNames[currentImageIndex])
        postedImage.backgroundColor = .gray
        postedImage.layer.borderWidth = 2
        postedImage.layer.borderColor = UIColor.black.cgColor
        postedImage.layer.cornerRadius = 15
        postedImage.contentMode = .scaleToFill
    }
    
    func setupReactionButtons() {
        firstEmoji.layer.cornerRadius = 23
>>>>>>> Stashed changes
        firstEmoji.setTitle("🫠", for: .normal)
        firstEmoji.backgroundColor = .red
        
        secondEmoji.layer.cornerRadius = 23
        secondEmoji.setTitle("🔥", for: .normal)
        secondEmoji.backgroundColor = .orange
        
        thirdEmoji.layer.cornerRadius = 23
        thirdEmoji.setTitle("❤️", for: .normal)
        thirdEmoji.backgroundColor = .yellow
        
        fourthEmoji.layer.cornerRadius = 23
        fourthEmoji.setTitle("⭐️", for: .normal)
        fourthEmoji.backgroundColor = .green
    }
    
<<<<<<< Updated upstream
    func setupButtons() {
        editButton.setImage(UIImage(systemName: "ellipsis.circle"), for: .normal)
        editButton.setTitle("", for: .normal)
    }
=======
//    func setupButtons() {
//        editButton.setImage(UIImage(systemName: "ellipsis.circle"), for: .normal)
//        editButton.setTitle("", for: .normal)
//    }
>>>>>>> Stashed changes
    
    @IBAction func pageChanged(_ sender: UIPageControl) {
        postedImage.image = UIImage(named: UserData().postImgNames[sender.currentPage])
    }
    
    func setupNavigationBarItem() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"),
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(shareButtonTapped))
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
        let ProfileViewControllerID = UIStoryboard(name: "ProfileStoryboard", bundle: .none).instantiateViewController(identifier: "profileViewControllerID") as! ProfileViewController
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
        let modalViewController = ModalViewController()
        modalViewController.view.backgroundColor = .yellow
        modalViewController.modalPresentationStyle = .pageSheet
        
        if let sheet = modalViewController.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.delegate = self
            sheet.prefersGrabberVisible = true
        }
        
        present(modalViewController, animated: true)
    }
    
    @objc func respondToSwipe(_ gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case .left:
                print("오른쪽으로 이동")
                imageIndex = (imageIndex + 1) % UserData().postImgNames.count
                postedImage.image = UIImage(named: UserData().postImgNames[imageIndex])

            case .right:
                print("왼쪽으로 이동")
                imageIndex = (imageIndex - 1 + UserData().postImgNames.count) % UserData().postImgNames.count
                postedImage.image = UIImage(named: UserData().postImgNames[imageIndex])

            default:
                print("오류 발생")
            }
            postedImage.image = UIImage(named: UserData().postImgNames[imageIndex])
            pageControl.currentPage = imageIndex
        }
    }
<<<<<<< Updated upstream
    
    // 너무 긴데... 이건 수정해보자
    @objc func respondToSwipe(_ gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case .left:
                print("왼쪽으로 이동")
                imageIndex = (imageIndex + 1) % postImgNames.count
                postedImage.image = UIImage(named: postImgNames[imageIndex])

            case .right:
                print("오른쪽으로 이동")
                imageIndex = (imageIndex - 1 + postImgNames.count) % postImgNames.count
                postedImage.image = UIImage(named: postImgNames[imageIndex])

            default:
                print("오류 발생")
            }
            postedImage.image = UIImage(named: postImgNames[imageIndex])
            pageControl.currentPage = imageIndex
        }
    }
=======
}

extension DetailViewController: UISheetPresentationControllerDelegate {
    
>>>>>>> Stashed changes
}
