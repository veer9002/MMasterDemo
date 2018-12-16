//
//  DBHelper.swift
//  MMasterDemo
//
//  Created by Manish Sharma on 16/12/18.
//  Copyright © 2018 Manish Sharma. All rights reserved.
//

import Foundation
import RealmSwift

class DBHelper {
    
    static let shared = DBHelper()
    
    func insertIntoDb(json: NSArray) -> NSArray {
        var dataArr = [Photos]()
        
        if json.count > 0 {
            for i in json {
                let photos = Photos()
                photos.albumId = json[i as! Int] as! Int
                photos.id = json[i as! Int] as! Int
                photos.albumTitle = json[i] as! String
                photos.url = json[i as! String] as! String
                photos.thumbnailUrl = json[i as! String] as! String

                dataArr.append(photos)
            }
        }
    }
}
