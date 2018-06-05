//
//  ViewController.swift
//  Protocal and delegate practice
//
//  Created by 楊威澤 on 2018/6/3.
//  Copyright © 2018 Peter. All rights reserved.
//

import UIKit

// STEP 2: Conform to Protocaol at the UIViewController which is going to be the delegate
class ViewController: UIViewController, CanReceive {

    @IBOutlet weak var label: UILabel!

    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sendButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "sendDataForwards", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendDataForwards" {

            let secondVC = segue.destination as! SecondViewController

            secondVC.data = textField.text!

            // STEP 6: Set the UIViewController as the delegator
            secondVC.delegate = self // self is this ViewController
        }
    }

    // STEP 3: Implement the required delegate method
    func dataReceived(data: String) {
        label.text = data
    }

}

