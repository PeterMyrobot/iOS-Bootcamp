//
//  Car.swift
//  Classes and Obejects
//
//  Created by 楊威澤 on 2018/5/31.
//  Copyright © 2018 Peter. All rights reserved.
//

import Foundation

enum CarType{
    case Sedan
    case Coupe
    case Hatchback
    
}

class Car {
    var colour = "Black"
    let numberOfSit = 5
    var typeOfCar : CarType = .Coupe
    
    init() {
        
    }
    
    convenience init(customerChosenColour : String){
        self.init()
        colour = customerChosenColour
    }
    
    func drive(){
        print("car is moving")
    }

}
