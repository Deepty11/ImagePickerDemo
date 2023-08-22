//
//  ViewController.swift
//  ImagePickerDemo
//
//  Created by Rehnuma Reza Deepty on 22/8/23.
//

import UIKit

class ViewController: UIViewController {
    var imagePicker = UIImagePickerController()
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var pickButton: UIButton = {
        let button = UIButton()
        button.setTitle("Pick", for: .normal)
        button.titleLabel?.textColor = .label
        button.backgroundColor = .red.withAlphaComponent(0.7)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    @objc func onClickPickButton() {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        
        present(imagePicker, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addConstraints()
        pickButton.addTarget(self, action: #selector(onClickPickButton), for: .touchUpInside)
        imagePicker.delegate = self
       
    }
    
    func addConstraints() {
        view.addSubview(imageView)
        view.addSubview(pickButton)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -12),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            pickButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -12),
            pickButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            pickButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -12),
            pickButton.heightAnchor.constraint(equalToConstant: 44),
            
        ])
    }


}


extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            imageView.image = image
        }
        
        dismiss(animated: true)
    }
}

