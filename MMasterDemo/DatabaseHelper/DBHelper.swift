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
    var realm: Realm!
    
//    func insertIntoDb(json: NSArray) {
//        var dataArr = [Photos]()
//        self.realm = try! Realm()
//        
//        if json.count > 0 {
//            for i in 0..<json.count {
//                let photos = Photos()
//                photos.albumId = (json[i] as AnyObject).value(forKey: "albumId") as! Int
//                photos.id = (json[i] as AnyObject).value(forKey: "id") as! Int
//                photos.title = (json[i] as AnyObject).value(forKey: "title") as! String
//                photos.url = (json[i] as AnyObject).value(forKey: "url") as! String
//                photos.thumbnailUrl = (json[i] as AnyObject).value(forKey: "thumbnailUrl") as! String
//
//                dataArr.append(photos)
//            }
//            try! self.realm.write {
//                if (dataArr.count > 0) {
//                    self.realm.add(dataArr, update: true)
//                } else {
//                    self.realm.add(dataArr)
//                }
//            }
//        } else {
//            print("No data")
//        }
//    }
    
    func inserIntoDB(data: [Photos]) {
        self.realm = try! Realm()

        try! self.realm.write {
            if data.count > 0 {
                self.realm.add(data, update: true)
            } else {
                self.realm.add(data)
            }
        }
    }
    
    
    
//    func insertComments(jsonArr: NSArray) {
//        var dataArr = [Comments]()
//        self.realm = try! Realm()
//
//        if jsonArr.count > 0 {
//            for i in 0..<jsonArr.count {
//                let comments = Comments()
//                comments.postId = (jsonArr[i] as AnyObject).value(forKey: "postId") as! Int
//                comments.id = (jsonArr[i] as AnyObject).value(forKey: "id") as! Int
//                comments.emailId = (jsonArr[i] as AnyObject).value(forKey: "email") as! String
//                comments.name = (jsonArr[i] as AnyObject).value(forKey: "name") as! String
//                comments.body = (jsonArr[i] as AnyObject).value(forKey: "body") as! String
//
//                dataArr.append(comments)
//            }
//            try! self.realm.write {
//                if (dataArr.count > 0) {
//                    self.realm.add(dataArr, update: true)
//                } else {
//                    self.realm.add(dataArr)
//                }
//            }
//        } else {
//            print("No data")
//        }
//    }
    
    func insertComments(data: [Comments]) {
        self.realm = try! Realm()
        
        try! self.realm.write {
            if data.count > 0 {
                self.realm.add(data, update: true)
            } else {
                self.realm.add(data)
            }
        }
    }
    
}


//{
//    var companiesArr = Array<Companies>()
//    self.realm = try! Realm()
//
//    if jsonData.count > 0 {
//
//        for i in 0 ..< jsonData.count {
//
//            let company = Companies()
//            company.companyID = nullToNilInt(value: (jsonData[i] as AnyObject).value(forKey: "CompanyId") as AnyObject) as! Int
//            company.name = nullToNil(value: (jsonData[i] as AnyObject).value(forKey: "Name") as AnyObject) as! String
//            company.groupID = nullToNilInt(value: (jsonData[i] as AnyObject).value(forKey: "GroupId") as AnyObject) as! Int
//            company.isActive.value = (jsonData[i] as AnyObject).value(forKey: "IsActive") as? Bool
//            company.isDeleted.value = (jsonData[i] as AnyObject).value(forKey: "IsDeleted") as? Bool
//
//            companiesArr.append(company)
//        }
//        try! self.realm.write {
//            if (companiesArr.count > 0) {
//                self.realm.add(companiesArr, update: true)
//            } else {
//                self.realm.add(companiesArr)
//            }
//        }
//    } else {
//        print("Array or dictionary is empty")
//    }
//}
