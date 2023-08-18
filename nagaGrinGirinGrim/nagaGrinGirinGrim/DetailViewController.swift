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
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var detailDateLabel: UILabel!
    @IBOutlet weak var detailBodyLabel: UILabel!
    
    @IBOutlet weak var firstEmoji: UIButton!
    @IBOutlet weak var secondEmoji: UIButton!
    @IBOutlet weak var thirdEmoji: UIButton!
    @IBOutlet weak var fourthEmoji: UIButton!
    
    var postTitles = [
        "식목일",
        "비 온 뒤 무지개",
        "이사를 했어요",
        "가족과 피크닉",
        "수박으로 집을 만들면?",
        "우리 엄마가 최고야",
        "짝사랑은 힘들어요",
        "지구를 보호해야해요!",
        "현대미술 체험기",
        "윤슬"
    ]

    var postContents = [
        "오늘은 식목일로 나무를 심는 날이었어요. 친구들과 함께 작은 나무를 흙에 심었어요. 나무가 자라면 더 많은 산소를 만들어주고 환경도 좋아질 거라고 배웠어요. 나무가 크면 우리도 더 행복한 세상에서 살 수 있을 거라고 생각했어요. 작은 식물을 키우는 건 미래를 위한 작은 행동이라는 것을 느꼈어요.",
        "오늘은 비 뒤에 무지개가 떴어요! 멋진 색으로 물고기 모양처럼 펼쳐진 무지개를 보며 신기하고 행복했어요. 빨강, 주황, 노랑, 초록, 파랑, 남색, 보라까지 아름다운 색깔이 순서대로 놓여있었어요. 무지개는 언제나 꿈과 희망을 상징하는데, 오늘 무지개를 보며 내일도 밝은 일들이 가득하길 바랐어요!",
        "오늘은 새 집으로 이사했어요. 새로운 공간에서 설레는 마음으로 짐을 풀었는데, 내 방 창문으로 보이는 풍경이 정말 예뻤어요. 처음엔 낯선 환경이지만, 가족들과 함께 새로운 추억을 만들며 조금씩 이곳을 내 공간으로 만들어갈 거예요. 이사와 함께 변화가 있지만, 새로운 시작이 기대돼요!",
        "오늘은 가족들과 함께 공원에서 피크닉을 즐겼어요. 누구나 좋아하는 음식을 가져가서 함께 먹으며 웃고 놀았어요. 파란 하늘 아래 푸른 잔디밭에서 누워 구름을 보면서 느긋한 시간도 가졌어요. 나무 그늘 아래에서 친구들과 놀면서 행복한 순간들을 만끽했어요. 이렇게 아름다운 날에 공원에서 시간을 보내니 기분이 너무 좋아요!",
        "더운 여름, 상상의 집은 수박으로 이뤄져요. 수박 벽돌로 지은 작은 집엔 지붕 아래에 시원한 수박 조각이 놓여 시원함이 느껴져요. 실내는 녹색과 붉은색 장식으로, 시원한 수박 조각들이 곳곳에 마치 놓여있어요. 빨강색 커튼을 열면 시원한 물맛 바람이 들어와 여름을 즐기며 힐링할 거예요.",
        "우리 엄마는 내게 늘 따뜻한 사랑을 주는 특별한 존재에요. 그녀의 미소와 품 안은 내게 언제나 안정과 행복을 선물해줘요. 힘들 때면 격려해주고, 기뻐할 때는 함께 웃어주는 그녀의 곁에서 자랄 수 있어서 행복해요. 정말 고맙고 사랑해요, 우리 엄마!",
        "요즘 학교에서 옆 자리 짝꿍이 좋아요. 그가 미소 지을 때면 마음이 설레고 두근거려요. 친구들에게 내 마음을 말하려 해도 어색해서 말 못하고 그냥 가만히 지켜보고 있어요. 혹시 내가 좋아하나 싶어서 그의 눈치를 보기도 하고, 가끔은 그의 관심을 끌려고 노력하기도 해요. 아직 고백은 어렵지만 그의 옆에 있으면 행복해요.",
        " 지구가 아픈 모습이 안타까워요. 나무들과 동물들이 없어지는데, 우리가 쓰레기를 줄이고 더 아껴쓰면 도움이 될 것 같아요. 물이 더러워지고 공기가 안 좋아지면 우리 모두 건강에도 나쁜 영향을 받을 거예요. 지구를 위해서 더 많은 관심과 노력이 필요한 시점이에요. 앞으로 나도 작은 일부터 시작해서 지구를 아끼는 습관을 가지고 싶어요.",
        "오늘은 현대 미술을 미술관에서 체험했어요. 다양한 작품들을 보면서 예술가들의 아이디어와 감정을 느낄 수 있었어요. 각 작품마다 다른 이야기와 느낌이 담겨있어서 정말 흥미로웠어요. 나도 나만의 감정을 예술로 표현해보고 싶은 생각이 들었어요.",
        
        "이번 주, 윤슬이라는 아름다운 단어를 배웠어요. 윤슬은 물에 빛이 반사돼 반짝반짝 빛나는 모습을 말해요. 이 단어를 알게 되면서 자연의 아름다움과 물 속에서 빛이 어떻게 표현되는지 배우게 됐어요. 이제 윤슬이라는 단어를 통해 물 속의 아름다움을 상상하며 더욱 더 풍요로운 언어와 지식을 얻게 되었어요."
        
    ]

    var postImgNames = [
        "tree",
        "rainbow",
        "house",
        "park",
        "watermelonhouse",
        "mymom",
        "heart",
        "earth",
        "modernart",
        "yoonseul",
    ]

    var postDates = [
        "2023년 4월 5일",
        "2023년 5월 2일",
        "2023년 5월 10일",
        "2023년 6월 12일",
        "2023년 6월 23일",
        "2023년 6월 29일",
        "2023년 7월 10일",
        "2023년 7월 31일",
        "2023년 8월 3일",
        "2023년 8월 16일"
    ]
    
    var imageIndex = 0
    var currentImageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupView()
        postedImage.isUserInteractionEnabled = true
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipe))
        swipeLeft.direction = .left
        postedImage.addGestureRecognizer(swipeLeft)
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipe))
        swipeRight.direction = .right
        postedImage.addGestureRecognizer(swipeRight)
        
    }
    
    func setupView() {
        pageControl.numberOfPages = postImgNames.count
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .lightGray
    }
    
    func setupUI() {
        setupImages()
        setupNavigationBarItem()
        setupReactionButtons()
        populateData()
        setupButtons()
    }
    
    func populateData() {
        detailTitleLabel.text = postTitles[0]
        detailBodyLabel.text = postContents[0]
        detailDateLabel.text = postDates[0]
        detailDateLabel.font = UIFont(name: detailDateLabel.font.fontName, size: 12)
    }
    
    func setupImages() {
        // 프로필
        profileImage.image = UIImage(named: "earth")
        
        // 포스트 이미지
        postedImage.image = UIImage(named: postImgNames[currentImageIndex])
        postedImage.backgroundColor = .black
        postedImage.layer.cornerRadius = 15
    }
    
    func setupReactionButtons() {
        firstEmoji.layer.cornerRadius = 10
        firstEmoji.setTitle("🫠", for: .normal)
        firstEmoji.backgroundColor = .red
        
        secondEmoji.layer.cornerRadius = 10
        secondEmoji.setTitle("🔥", for: .normal)
        secondEmoji.backgroundColor = .orange
        
        thirdEmoji.layer.cornerRadius = 10
        thirdEmoji.setTitle("❤️", for: .normal)
        thirdEmoji.backgroundColor = .yellow
        
        fourthEmoji.layer.cornerRadius = 10
        fourthEmoji.setTitle("⭐️", for: .normal)
        fourthEmoji.backgroundColor = .green
    }
    
    func setupButtons() {
        editButton.setImage(UIImage(systemName: "ellipsis.circle"), for: .normal)
        editButton.setTitle("", for: .normal)
    }
    
    @IBAction func pageChanged(_ sender: UIPageControl) {
        postedImage.image = UIImage(named: postImgNames[sender.currentPage])
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
    
    @IBAction func firstEmojiButtonTapped(_ sender: UIButton) {
        print("첫번쨰 버튼이 눌렸습니다.")
    }
    
    @IBAction func secondEmojiButtonTapped(_ sender: UIButton) {
        print("두번쨰 버튼이 눌렸습니다.")
    }
    
    
    @IBAction func thirdEmojiButtonTapped(_ sender: UIButton) {
        print("세번쨰 버튼이 눌렸습니다.")
    }
    
    @IBAction func fourthEmojiButtonTapped(_ sender: UIButton) {
        print("네번쨰 버튼이 눌렸습니다.")
    }
    
    @objc func editButtonTapped() {
        print("수정 버튼이 눌렸습니다.")
    }
    
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
}
