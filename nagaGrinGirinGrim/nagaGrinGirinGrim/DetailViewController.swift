//
//  DetailViewController.swift
//  nagaGrinGirinGrim
//
//  Created by 보경 on 2023/08/14.
//

import UIKit

class DetailViewController: UIViewController {
    
//    var image = []
    
    @IBOutlet weak var postedImage: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var detailDateLabel: UILabel!
    @IBOutlet weak var detailBodyLabel: UILabel!
    
    @IBOutlet weak var firstEmojiButton: UIButton!
    @IBOutlet weak var secondEmojiButton: UIButton!
    @IBOutlet weak var thirdEmojiButton: UIButton!
    @IBOutlet weak var fourthEmojiButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        editButton.setImage(UIImage(systemName: "ellipsis.circle"), for: .normal)
    }
    
    func configureUI() {
        configureProfileImage()
        configureImage()
        setNavigationBarItem()
        configureButton()
    }
    
    func configureProfileImage() {
        profileImage.image = UIImage(systemName: "person.crop.circle.fill")
    }
    
    func configureImage() {
        postedImage.image = UIImage(systemName: "scribble")
        postedImage.backgroundColor = .red
        postedImage.layer.cornerRadius = 25
    }
    
    func configureButton() {
        firstEmojiButton.layer.cornerRadius = 10
        firstEmojiButton.setTitle("🫠", for: .normal)
        firstEmojiButton.backgroundColor = .red
        
        secondEmojiButton.layer.cornerRadius = 10
        secondEmojiButton.setTitle("🔥", for: .normal)
        secondEmojiButton.backgroundColor = .orange
        
        thirdEmojiButton.layer.cornerRadius = 10
        thirdEmojiButton.setTitle("❤️", for: .normal)
        thirdEmojiButton.backgroundColor = .yellow
        
        fourthEmojiButton.layer.cornerRadius = 10
        fourthEmojiButton.setTitle("⭐️", for: .normal)
        fourthEmojiButton.backgroundColor = .green
    }
    
    @IBAction func pageChanged(_ sender: UIPageControl) {
        postedImage.image = UIImage(named: images[pageControl.currentPage])
    }
    
    
    func setNavigationBarItem() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"),
                                                                 style: .plain, target: self,
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
    
    func didPressLikeButton(_ button: UIButton) {

        if (button.imageView?.image == UIImage(named: "like")) {
            button.setTitle("🔥", for: .normal)
        } else {
            button.setTitle("🥲", for: .normal)
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

//extension DetailViewController: UIActivityItemSource {
//
//    let items = [self]
//    let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
//    present
//
//
//    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
//        return "이게 돼?"
//    }
//
//    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
//        return "진짜로?"
//    }
//}
