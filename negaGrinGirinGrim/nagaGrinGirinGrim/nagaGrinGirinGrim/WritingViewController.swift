//
//  WritingViewController.swift
//  nagaGrinGirinGrim
//
//  Created by 보경 on 2023/08/14.
//
import Foundation
import UIKit

let post = UserDefaults.standard

class WritingViewController: UIViewController {
    
    var postTitles: [String] = []
    var postContents: [String] = []
    var postDates: [String] = []
    var postImgNames: [String] = []
    var postImgURLs: [String] = []
  
    @IBOutlet weak var postTitle: UITextField!
    @IBOutlet weak var postContent: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var clickPost: UIButton!
    @IBOutlet weak var clickCancel: UIButton!
    @IBOutlet weak var clickAdd: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        addPhotos()
        self.view.addSubview(self.clickCancel)
    }
    
    @IBAction func postContents(_ sender: Any) {
        print("등록버튼을 눌렀습니다.")
        
        let postTitle = postTitle.text
        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        dateFormatter.dateStyle = .long
        let postDate = dateFormatter.string(from: self.datePicker.date)
        let postContent = postContent.text
        let postImg = imageView.image
        
        if  let data = postImg?.pngData() {
            let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let url = documents.appendingPathComponent("postImg.png")
            
            postImgURLs.append(url.absoluteString)
            UserDefaults.standard.set(postImgURLs, forKey: "postImageURLs")
            
            do {
                try data.write(to: url)
                UserDefaults.standard.set(url, forKey: "image")
            } catch {
                print("등록된 사진이 없음")
            }
        }
        
        postTitles.append(postTitle ?? "제목 없음")
        postDates.append(postDate)
        postContents.append(postContent ?? "내용 없음")
        
        print(postTitle ?? "제목 없음")
        print(postContent ?? "내용 없음")
        
        
        UserDefaults.standard.set(postImgNames, forKey: "postImgNames")
        UserDefaults.standard.set(postTitles, forKey: "postTitles")
        UserDefaults.standard.set(postDates, forKey: "postDates")
        UserDefaults.standard.set(postContents, forKey: "postContents")


        let test0 = UserDefaults.standard.array(forKey: "postImageURLs") as! [String]
        let test1 = UserDefaults.standard.array(forKey: "postTitles") as? [String]
        let test2 = UserDefaults.standard.array(forKey: "postDates") as? [String]
        let test3 = UserDefaults.standard.array(forKey: "postContents") as? [String]
        
        print("test0 값은 -- : \(test0)")
        print(test1)
        print(test2)
        print(test3)
        
        test0.forEach { urlString in
            let url = URL(string: urlString)!
            let data = try! Data(contentsOf: url)
            let imageLoaded = UIImage(data: data)
            print("image -- \(imageLoaded)")
        }
    }
    
    @IBAction func takeBack(_ sender: Any) {
        self.dismiss(animated: true)
        clickCancel.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    }
    
    func setupViews() {
//        clickAdd.setTitle("사진", for: .normal)
        clickAdd.addTarget(self, action: #selector(uploadPhoto), for: .touchUpInside)
        
        view.addSubview(imageView)
        view.addSubview(clickAdd)
    }
    
    func addPhotos() {
        let safeArea = view.safeAreaLayoutGuide; NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func uploadPhoto() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        // imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }
    @objc func buttonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension WritingViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage =
            info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                imageView.contentMode = .scaleAspectFit
                imageView.image = pickedImage
            }
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
