//
//  ViewController.swift
//  MMasterDemo
//
//  Created by Manish Sharma on 16/12/18.
//  Copyright © 2018 Manish Sharma. All rights reserved.
//

import UIKit
import Alamofire
import RealmSwift
import Kingfisher

class CollectionWithAVC: UIViewController {

    // IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    var realm = try! Realm()
    var dataArray = [Photos]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fetchFromDB()
    }

    func fetchFromDB() {
        let list = realm.objects(Photos.self)
        print(list.count)
        
        if list.count > 0 {
            for i in 0..<list.count {
                dataArray.append(list[i])
            }
        } else {
//            fetchAPI()
            let url = Constants.Urls.photosUrl
            APIManager().fetchAPI(urlString: url) { (photos) in
                self.dataArray = photos
                self.collectionView.reloadData()
            }
        }
    }
    
//    func fetchAPI() {
//        let url = Constants.Urls.photosUrl
//        Alamofire.request(url).responseJSON { response in
//            print("Request: \(String(describing: response.request))")   // original url request
//            print("Response: \(String(describing: response.response))") // http url response
//            print("Result: \(response.result)")                         // response serialization result
//
//            if let json = response.result.value {
//                print("JSON: \(json)") // serialized json response
//                guard let jsonArray = json as? NSArray else { return print("Cannot convert json to error") }
//                print(jsonArray.count)
//                _ = DBHelper.shared.insertIntoDb(json: jsonArray)
//            }
////            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
////                print("Data: \(utf8Text)") // original server data as UTF8 string
////            }
//             self.fetchFromDB()
//             self.collectionView.reloadData()
//        }
//    }
}

extension CollectionWithAVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(dataArray.count)
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PhotosCell
        if let image = cell.viewWithTag(1) as? UIImageView {
            let imageUrl = dataArray[indexPath.row].url
            let url = URL(string: imageUrl)
            image.kf.setImage(with: url)
        }
        return cell
    }
}

extension CollectionWithAVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWidth = collectionView.bounds.width
        return CGSize(width: collectionWidth/2, height: collectionWidth/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
