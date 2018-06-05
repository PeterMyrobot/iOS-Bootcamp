//
//  SecondViewController.swift
//  Protocal and delegate practice
//
//  Created by 楊威澤 on 2018/6/3.
//  Copyright © 2018 Peter. All rights reserved.
//

import UIKit

// STEP 1: Create the Protocol
protocol CanReceive {

    func dataReceived(data: String)

}

class SecondViewController: UIViewController {

    // STEP 4: Create a property call delegate to do delegating, the type will be the protocol name (is an optional becuase delegate might be nil)
    var delegate : CanReceive?

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!

    var data = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = data
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func sendDataBack(_ sender: Any) {
        // STEP 5: Trigger the delegate method
        delegate?.dataReceived(data: textField.text!)

        dismiss(animated: true, completion: nil)

    }

}
