//
//  Self-Driving Car.swift
//  Classes and Obejects
//
//  Created by 楊威澤 on 2018/6/1.
//  Copyright © 2018 Peter. All rights reserved.
//

import Foundation

class SelfDrivingCar: Car {
    
    var destination : String?
    // Want to that destination nil till we set it
    
    override func drive() {
        super.drive()
        
///// Force unwrapping
//        if destination != nil{
//            print("driving towards " + destination!)
//        }

        // optional binding
        if let userSetDestination = destination {

            print("driving towards " + userSetDestination)

        }

    }

}
