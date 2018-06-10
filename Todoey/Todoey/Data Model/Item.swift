//
//  Item.swift
//  Todoey
//
//  Created by 楊威澤 on 2018/6/9.
//  Copyright © 2018 Peter. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {

    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")

}
