//
//  Category.swift
//  Todoey
//
//  Created by 楊威澤 on 2018/6/9.
//  Copyright © 2018 Peter. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
