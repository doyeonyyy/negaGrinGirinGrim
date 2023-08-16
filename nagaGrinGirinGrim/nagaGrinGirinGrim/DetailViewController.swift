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
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var detailDateLabel: UILabel!
    @IBOutlet weak var detailBodyLabel: UILabel!
    
    @IBOutlet weak var firstEmoji: UIButton!
    @IBOutlet weak var secondEmoji: UIButton!
    @IBOutlet weak var thirdEmoji: UIButton!
    @IBOutlet weak var fourthEmoji: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        editButton.setImage(UIImage(systemName: "ellipsis.circle"), for: .normal)
//        navigationBarHidden()
        navigationSwipeBackMotion()
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
    
    @IBAction func pageChanged(_ sender: UIPageControl) {
        //        postedImage.image = UIImage(named: images[pageControl.currentPage])
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
}

extension DetailViewController: UIGestureRecognizerDelegate {
    func navigationBarHidden() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func navigationSwipeBackMotion() {
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
}
