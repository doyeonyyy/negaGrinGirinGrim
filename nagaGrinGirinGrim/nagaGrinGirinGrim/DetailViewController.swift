//
//  DetailViewController.swift
//  nagaGrinGirinGrim
//
//  Created by 보경 on 2023/08/14.
//

import UIKit

class DetailViewController: UIViewController {
    
//MARK: - UIOutlet
    
    @IBOutlet weak var topBarView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var addPostButton: UIButton!
    @IBOutlet weak var viewProfileButton: UIButton!
    
//    @IBOutlet weak var informationStack: UIStackView!
//    @IBOutlet weak var reactionStack: UIStackView!
    
    @IBOutlet weak var postedImage: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!

    @IBOutlet weak var reactionButton: UIButton!
    @IBOutlet weak var reactionTracker: UILabel!

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var detailDateLabel: UILabel!
    @IBOutlet weak var detailBodyLabel: UILabel!

    @IBOutlet weak var firstEmoji: UIButton!
    @IBOutlet weak var secondEmoji: UIButton!
    @IBOutlet weak var thirdEmoji: UIButton!
    @IBOutlet weak var fourthEmoji: UIButton!
    
// MARK: - 전역변수
    
    var reactionCollection: [String: Int] = [:]
//    var totalReactionCount: [Int] = [0, 0, 0, 0]
    var firstReactionCount = 0
    var secondReactionCount = 0
    var thirdReactionCount = 0
    var fourthReactionCount = 0
    var imageIndex = 0
    var currentImageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        enableSwipe()
//        hideReactionView()
        
        // 이모지 라벨 수치 변경
//        let emojiCount = reactionCollection.values
//        let calculate = emojiCount.reduce(0, {$0 + $1})
//        emojiTracker.text = String(calculate) //String(emojiCount.reduce(0){$0 + $1})
                
        // 이미지 뷰 클릭 액션
        let profileImageTapped = UITapGestureRecognizer(target: self, action: #selector(profileImageTapped))
        profileImage.isUserInteractionEnabled = true
        profileImage.addGestureRecognizer(profileImageTapped)
    }
    
    // MARK: - 어플 셋업
    
    func setupUI() {
        setupImages()
        setupEmojiButtons()
        populateData()
        setupButtons()
        setupView()
    }
    
    func setupImages() {
        setUpProfileImage()
    }
    
    func setUpProfileImage() {
        profileImage.image = UIImage(named: userData.profile.profilePicture)
        profileImage.backgroundColor = .black
        profileImage.layer.borderWidth = 0.25
        profileImage.layer.borderColor = UIColor.black.cgColor
        profileImage.layer.cornerRadius = 20
        profileImage.contentMode = .scaleAspectFit
//        UIImage(named: defaults.array(forKey: "profileImage"))
    }

    
    func setupEmojiButtons() {
        let emojiSet = ["🫠","🔥","⭐️","❤️"]
        let buttons = [firstEmoji, secondEmoji, thirdEmoji, fourthEmoji]
        
        for (index,button) in buttons.enumerated() {
            if index < emojiSet.count {
                button?.setTitle(emojiSet[index], for: .normal)
                button?.layer.cornerRadius = 20
                button?.layer.borderWidth = 1
                button?.layer.borderColor = UIColor.gray.cgColor
                button?.backgroundColor = .black
                button?.clipsToBounds = true
            }
        }
    }
    
    func populateData() {
        // array로 저장을 했는데 그걸 부르는 방법을 모르겠다 ㅠㅠㅠ
        if let selectedIndexPath = defaults.value(forKey: "selectedIndexPath") as? Int {
            let postImageName = userData.postImgNames[selectedIndexPath]
            let postTitle = userData.postTitles[selectedIndexPath]
            let postDate = userData.postDates[selectedIndexPath]
            let postContent = userData.postContents[selectedIndexPath]
            let contentCount = userData.postImgNames[selectedIndexPath].count
            
            postedImage.image = UIImage(named: postImageName)
            detailBodyLabel.text = postContent
            detailDateLabel.text = postDate
            detailTitleLabel.text = postTitle
            pageControl.numberOfPages = contentCount
        }
    }
    
    func setupButtons() {
        editButton.setImage(UIImage(systemName: "ellipsis.circle"), for: .normal)
        editButton.setTitle("", for: .normal)
    }
    
    func setupView() {
//        pageControl.numberOfPages = userData.postImgNames.count
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = .yellow
        pageControl.pageIndicatorTintColor = .lightGray
//        topBarView.layer.cornerRadius = 20
//        topBarView.backgroundColor = UIColor(cgColor: CGColor(red: 255, green: 255, blue: 255, alpha: 0.5))
//        topBarView.layer.shadowOffset = CGSize(width: 0, height: 0)
//        topBarView.layer.shadowOpacity = 0.6
//        topBarView.layer.shadowRadius = 10
    }
    
//    func hideReactionView() {
//        if firstReactionCount > 0 {
//            reactionStack.isHidden = false
//            let stackViewHeightConstraint = NSLayoutConstraint(item: reactionStack!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30)
//            stackViewHeightConstraint.isActive = true
//            stackViewHeightConstraint.constant = 80
//        } else {
//            reactionStack.isHidden = true
//        }
//    }
    
    func enableSwipe() {
        postedImage.isUserInteractionEnabled = true
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipe))
        swipeLeft.direction = .left
        postedImage.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipe))
        swipeRight.direction = .right
        postedImage.addGestureRecognizer(swipeRight)
    }
    
    @IBAction func pageChanged(_ sender: UIPageControl) {
        postedImage.image = UIImage(named: userData.postImgNames[sender.currentPage])
    }
    
    @IBAction func backAct(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    // VC가 존재할 경우, 재활용하여 불러오는 방법 - if not 생성
    @IBAction func addPostButtonTapped(_ sender: UIButton) {
        if let writingViewController = self.navigationController?.viewControllers.first(where: { $0 is WritingViewController }) as? WritingViewController {
            self.navigationController?.pushViewController(writingViewController, animated: true)
        }
        let writingViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "writingViewControllerID") as! WritingViewController
        self.navigationController?.pushViewController(writingViewController, animated: true)
    }
    
    @IBAction func viewProfileButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func reactionButtonTapped(_ sender: UIButton) {
        print("반응 갯수를 확인합니다")
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
        let totalCount = reactionCollection.values.reduce(1, +)
        
        switch sender {
        case firstEmoji:
            let reaction = "🫠"
            firstReactionCount += 1
            reactionCollection.updateValue(firstReactionCount, forKey: reaction)
            reactionTracker.text = "\(totalCount)"
            
        case secondEmoji:
            let reaction = "🔥"
            secondReactionCount += 1
            reactionCollection.updateValue(secondReactionCount, forKey: reaction)
            reactionTracker.text = "\(totalCount)"
            
            reactionButton.setImage(UIImage(systemName: "heart.suit.fill"), for: .normal)
            
        case thirdEmoji:
            let reaction = "⭐️"
            thirdReactionCount += 1
            reactionCollection.updateValue(thirdReactionCount, forKey: reaction)
            reactionTracker.text = "\(totalCount)"
            
        case fourthEmoji:
            let reaction = "❤️"
            fourthReactionCount += 1
            reactionCollection.updateValue(fourthReactionCount, forKey: reaction)
            reactionTracker.text = "\(totalCount)"

        //에러 처리 필요
        default: print("에러가 발생했습니다.")
        }
    }
    
    @objc func respondToSwipe(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case .left:
                print("오른쪽으로 이동")
                imageIndex = (imageIndex + 1) % userData.postImgNames.count
                postedImage.image = UIImage(named: userData.postImgNames[imageIndex])

            case .right:
                print("왼쪽으로 이동")
                imageIndex = (imageIndex - 1 + userData.postImgNames.count) % userData.postImgNames.count
                postedImage.image = UIImage(named: userData.postImgNames[imageIndex])

            default:
                print("오류 발생")
            }
            postedImage.image = UIImage(named: userData.postImgNames[imageIndex])
            pageControl.currentPage = imageIndex
        }
    }
}

extension DetailViewController: UISheetPresentationControllerDelegate {
}

extension DetailViewController: UIGestureRecognizerDelegate {
    func navigationBarHidden() {
        self.navigationController?.navigationBar.isHidden = true
    }
}
