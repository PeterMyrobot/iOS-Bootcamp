//
//  ViewController.swift
//  SeeFood
//
//  Created by 楊威澤 on 2018/6/11.
//  Copyright © 2018 Peter. All rights reserved.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!

    let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false

    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {

        if let userPickImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            imageView.image = userPickImage

            guard let ciImage = CIImage(image: userPickImage) else { fatalError("Could not convert image")}

            detec(image: ciImage)
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }

    func detec(image: CIImage) {

        guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else{
            fatalError("Loading CoreML model failed.")
        }

        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let results = request.results as? [VNClassificationObservation] else {
                fatalError("Error get results")
            }

            if let firstResult = results.first {
                if firstResult.identifier.contains("hotdog"){
                    self.navigationItem.title = "Hotdog!"
                } else {
                    self.navigationItem.title = "Not Hotdog!"
                }
            }
        }
        let handler = VNImageRequestHandler(ciImage: image)

        do {
            try handler.perform([request])
        }catch {
            print(error)
        }

    }

    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        present(imagePicker, animated: true, completion: nil)
    }

}

