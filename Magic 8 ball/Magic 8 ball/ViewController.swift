//
//  ViewController.swift
//  Magic 8 ball
//
//  Created by 楊威澤 on 2018/5/27.
//  Copyright © 2018 Peter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let ballArry = ["ball1", "ball2", "ball3", "ball4", "ball5"]
    var randomBallNumber = 0


    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newBallImage()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func askButtonPressed(_ sender: Any) {
        
        newBallImage()
        
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        newBallImage()
        
    }
    
    func newBallImage(){
        randomBallNumber = Int(arc4random_uniform(5))
        imageView.image = UIImage(named: ballArry[randomBallNumber])
    }
    
}

