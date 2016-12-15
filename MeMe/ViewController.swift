//
//  ViewController.swift
//  MeMe
//
//  Created by Naif Alrashed on 12/15/16.
//  Copyright © 2016 Naif Alrashed. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
    }

    @IBAction func camera(_ sender: Any) {
        createAnLaunchUIImagePicker(with: .camera)
    }

    @IBAction func album(_ sender: Any) {
        createAnLaunchUIImagePicker(with: .photoLibrary)
    }
    
    private func createAnLaunchUIImagePicker(with type: UIImagePickerControllerSourceType) {
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = type
        present(controller, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            imageView.image = image
        }
        
        dismiss(animated: true, completion: nil)
    }
}

