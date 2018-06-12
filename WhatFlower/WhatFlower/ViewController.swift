//
//  ViewController.swift
//  WhatFlower
//
//  Created by 楊威澤 on 2018/6/12.
//  Copyright © 2018 Peter. All rights reserved.
//

import UIKit
import CoreML
import Vision
import Alamofire
import SwiftyJSON
import SDWebImage

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    let wikipediaURl = "https://en.wikipedia.org/w/api.php"

    let imagePicker = UIImagePickerController()

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var flowerDiscribtion: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true

    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let userPickImage = info[UIImagePickerControllerEditedImage] as? UIImage {

            guard let ciImage = CIImage(image: userPickImage) else {
                fatalError("Could not convert image")
            }

            detect(image: ciImage)
        }


    }

    func detect(image: CIImage){

        guard let model = try? VNCoreMLModel(for: FlowerClassifier().model) else {
            fatalError("Loading coreML model Failed")
        }

        let request = VNCoreMLRequest(model: model) { (request, error) in

            guard let results = request.results?.first as? VNClassificationObservation else {
                fatalError("Failed to get results")
            }

            self.navigationItem.title = results.identifier.capitalized
            self.getWikiPediaDate(flowerName: results.identifier)

        }

        let handler = VNImageRequestHandler(ciImage: image)

        do {
            try handler.perform([request])
        } catch {
            print(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cameraPredded(_ sender: UIBarButtonItem) {

        present(imagePicker, animated: true, completion: nil)
    }

    func getWikiPediaDate(flowerName: String) {

        let parameters : [String:String] = [
            "format" : "json",
            "action" : "query",
            "prop" : "extracts|pageimages",
            "exintro" : "",
            "explaintext" : "",
            "titles" : flowerName,
            "indexpageids" : "",
            "redirects" : "1",
            "pithumbsize": "500"
        ]

        Alamofire.request(wikipediaURl, method: .get, parameters: parameters).responseJSON { (response) in
            if response.result.isSuccess {
                print("Sucess get wiki data")
                let wikiData: JSON = JSON(response.result.value!)

                print(wikiData)
                let pageNumber = wikiData["query"]["pageids"][0].stringValue

                let discription = wikiData["query"]["pages"][pageNumber]["extract"].stringValue

                let flowerImageURL = wikiData["query"]["pages"][pageNumber]["thumbnail"]["source"].stringValue

                self.imageView.sd_setImage(with: URL(string: flowerImageURL))

                self.flowerDiscribtion.text = discription

                self.imagePicker.dismiss(animated: true, completion: nil)
            }
        }

    }

}

