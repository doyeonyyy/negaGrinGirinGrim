import Foundation
import UIKit

class WritingViewController: UIViewController {
    
//    var postImgURLs: [String] = []
    let userData = UserData.shared
  
    @IBOutlet weak var clickCancel: UIButton!
    @IBOutlet weak var postTitle: UITextField!
    
//    @IBOutlet weak var postContent: UITextField!
    @IBOutlet weak var postContent: UITextView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var clickPost: UIButton!
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
        dateFormatter.dateStyle = .long
        let postDate = dateFormatter.string(from: self.datePicker.date)
        let postContent = postContent.text
        let postImg = "heart"
        
        userData.postTitles.append(postTitle ?? "제목 없음")
        userData.postDates.append(postDate)
        userData.postContents.append(postContent ?? "내용 없음")
        userData.postImgNames.append(postImg)

        defaults.set(userData.postImgNames, forKey: "postImgNames")
        defaults.set(userData.postTitles, forKey: "postTitles")
        defaults.set(userData.postDates, forKey: "postDates")
        defaults.set(userData.postContents, forKey: "postContents")
        print(defaults.array(forKey: "postTitles")!.count)
//        let mainPageStoryboardID = UIStoryboard(name: "Main", bundle: .none).instantiateViewController(identifier: "mainPageViewControllerID") as! MainPageViewController
//        navigationController?.pushViewController(mainPageStoryboardID, animated: false)
        dismiss(animated: true)
    }
    
    @IBAction func takeBack(_ sender: Any) {
        if self.presentingViewController != nil {
             self.dismiss(animated: true)
           } else if self.navigationController != nil {
             self.navigationController?.popViewController(animated: true)
           }
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
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
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


// 추후 적용

//        if  let data = postImg?.pngData() {
//            let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
//            let url = documents.appendingPathComponent("postImg.png")
//
//            postImgURLs.append(url.absoluteString)
//            UserDefaults.standard.set(postImgURLs, forKey: "postImageURLs")
//
//            do {
//                try data.write(to: url)
//                UserDefaults.standard.set(url, forKey: "image")
//            } catch {
//                print("등록된 사진이 없음")
//            }
//        }
//let test0 = UserDefaults.standard.array(forKey: "postImageURLs") as! [String]
//        test0.forEach { urlString in
//            let url = URL(string: urlString)!
//            let data = try! Data(contentsOf: url)
//            let imageLoaded = UIImage(data: data)
//            print("image -- \(imageLoaded)")
//        }
