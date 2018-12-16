//
//  Comments.swift
//  MMasterDemo
//
//  Created by Manish Sharma on 16/12/18.
//  Copyright © 2018 Manish Sharma. All rights reserved.
//

import Foundation
import RealmSwift

//"postId": 10,
//"id": 48,
//"name": "consequatur animi dolorem saepe repellendus ut quo aut tenetur",
//"email": "Manuela_Stehr@chelsie.tv",
//"body": "illum et alias quidem magni voluptatum\nab soluta ea qui saepe corrupti hic et\ncum repellat esse\nest sint vel veritatis officia consequuntur cum"

class Comments: Object {
    @objc dynamic var postId = Int()
    @objc dynamic var id = Int()
    @objc dynamic var name = ""
    @objc dynamic var emailId = ""
    @objc dynamic var body = ""
}
