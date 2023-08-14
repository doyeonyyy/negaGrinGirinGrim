//
//  WritingViewController.swift
//  nagaGrinGirinGrim
//
//  Created by 보경 on 2023/08/14.
//
import Foundation
import UIKit

class WritingViewController: UIViewController {
    
    @IBOutlet weak var clickAdd: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        addPhotos()
    }

    func setupViews() {
        clickAdd.setTitle("사진", for: .normal)
        clickAdd.addTarget(self, action: #selector(uploadPhoto), for: .touchUpInside)
        
        view.addSubview(imageView)
        view.addSubview(clickAdd)
        view.subviews.forEach { view in view.translatesAutoresizingMaskIntoConstraints = false
            view.sizeToFit()
        }
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
