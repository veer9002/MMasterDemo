//
//  Photos.swift
//  MMasterDemo
//
//  Created by Manish Sharma on 16/12/18.
//  Copyright © 2018 Manish Sharma. All rights reserved.
//

import Foundation
import RealmSwift

//"albumId": 1,
//"id": 1,
//"title": "accusamus beatae ad facilis cum similique qui sunt",
//"url": "https://via.placeholder.com/600/92c952",
//"thumbnailUrl": "https://via.placeholder.com/150/92c952"

// if boolean .. let isDuplicate = RealmOptional<Bool>()

class Photos: Object, Decodable {
    @objc dynamic var albumId = Int()
    @objc dynamic var id = Int()
    @objc dynamic var title = ""
    @objc dynamic var url = ""
    @objc dynamic var thumbnailUrl = ""
    
    // set primary key "invoiceID"
    override static func primaryKey() -> String {
        return "id"
    }
}
