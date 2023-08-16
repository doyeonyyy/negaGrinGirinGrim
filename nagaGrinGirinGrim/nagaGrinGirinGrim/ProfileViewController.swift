//
//  ProfileViewController.swift
//  nagaGrinGirinGrim
//
//  Created by 보경 on 2023/08/14.
//


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
    "yoonseul"
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

import UIKit
import Foundation

struct User {
    var profilePicture: String
    var name: String
    var mood: String
    var introduction : String
    var titleOfAnniversary : String
    var anniversary : String
}

let defaults = UserDefaults.standard

let defaultProfile = User(profilePicture: "two_zo_img", name: "⚡️에너자이조⚡️", mood: "🔥", introduction: "열쩡👍열쩡👍열쩡👍", titleOfAnniversary: "2조 결성일!", anniversary: "2023/07/31")

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myDiaryTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyDiaryTableViewCell
        
        cell.titleLable.text = postTitles[indexPath.row]
        cell.descriptLabel.text = postContents[indexPath.row]
        cell.dateLabel.text = postDates[indexPath.row]
        cell.postImage.image = UIImage(named: postImgNames[indexPath.row])
        
        return cell
    }
    
    // cell 높이 지정
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
        }
    


    @IBAction func editBtnAct(_ sender: Any) {
        let editProfileViewControllerID = UIStoryboard(name: "EditProfileStoryboard", bundle: .none).instantiateViewController(identifier: "editProfileViewControllerID") as! EditProfileViewController
        self.present(editProfileViewControllerID, animated: true, completion: nil)
    }
    @IBAction func setDefault(_ sender: Any) {
        print("click arrow btn")
        defaults.set(defaultProfile.profilePicture, forKey: "profilePicture")
        defaults.set(defaultProfile.name, forKey: "name")
        defaults.set(defaultProfile.mood, forKey: "mood")
        defaults.set(defaultProfile.introduction, forKey: "introduction")
        defaults.set(defaultProfile.titleOfAnniversary, forKey: "titleOfAnniversary")
        defaults.set(defaultProfile.anniversary, forKey: "anniversary")
        loading()
        self.view.reloadInputViews()
    }
    
    @IBOutlet weak var myDiaryTable: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var anniversaryLabel: UILabel!
    @IBOutlet weak var titleOfAnniversaryLabel: UILabel!
    @IBOutlet weak var introductionTextView: UITextView!
    @IBOutlet weak var moodLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    
    func loading() {
        let picName: String = defaults.string(forKey: "profilePicture")!
        print(picName)
        profileImg.image = UIImage(named: picName)
        profileImg.frame(forAlignmentRect: CGRect(x: 20, y: 110, width: 150, height: 150))
        
        // 둥근 모서리
        profileImg.layer.cornerRadius = 15
        profileImg.layer.shadowOffset = CGSize(width: 5, height: 5)
        profileImg.layer.shadowOpacity = 0.7
        profileImg.layer.shadowRadius = 5
        profileImg.layer.shadowColor = UIColor.gray.cgColor
        
        
        nameLabel.text! = defaults.string(forKey: "name") ?? "nil"
        moodLabel.text! = defaults.string(forKey: "mood") ?? "nil"
        introductionTextView.text! = defaults.string(forKey: "introduction") ?? "nil"
        titleOfAnniversaryLabel.text! = defaults.string(forKey: "titleOfAnniversary") ?? "nil"
        anniversaryLabel.text! = defaults.string(forKey: "anniversary") ?? "nil"
}

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        view.addSubview(scrollView)
        scrollView.addSubview(myDiaryTable)
        myDiaryTable.delegate = self
        myDiaryTable.dataSource = self
        scrollView.addSubview(profileImg)
        loading()
    }
    
    
    @objc func returnIndexPath(_ sender: Any) -> Int {
        let contentView = (sender as AnyObject).superview
        let cell = contentView??.superview as! MyDiaryTableViewCell
            let index = myDiaryTable.indexPath(for: cell)!.row
            print(index as Any)
            return index
        }

}
