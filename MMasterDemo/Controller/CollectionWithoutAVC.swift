//
//  CollectionWithoutAVC.swift
//  MMasterDemo
//
//  Created by Manish Sharma on 16/12/18.
//  Copyright © 2018 Manish Sharma. All rights reserved.
//

import UIKit
import RealmSwift

class CollectionWithoutAVC: UIViewController {
    
    var realm = try! Realm()
    var dataArr = [Photos]()
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchFromDB()
    }
    
    func fetchFromDB() {
        let list = realm.objects(Photos.self)
        print(list.count)
        
        if list.count > 0 {
            for i in 0..<list.count {
                dataArr.append(list[i])
            }
        } else {
            fetchJson()
        }
    }
    
    func fetchJson() {
        let urlString = Constants.Urls.photosUrl
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            DispatchQueue.main.async {
                if let err = err {
                    print("Failed", err)
                    return
                }
                
                if let response = response as? HTTPURLResponse {
                    
                     guard response.statusCode == 200 else { return }
                     guard let data = data else { return }
                    
                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        self.dataArr = try decoder.decode([Photos].self, from: data)
                        _ = DBHelper.shared.insertIntoDb(json: self.dataArr as NSArray)
                        self.collectionView.reloadData()
                        print(self.dataArr.count)
                    } catch let jsonErr  {
                        print("faield to decode", jsonErr)
                    }
                }
            }
            }.resume()
    }
    
}


extension CollectionWithoutAVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        if let image = cell.viewWithTag(1) as? UIImageView {
            let imageUrl = dataArr[indexPath.row].url
            let url = URL(string: imageUrl)
            image.kf.setImage(with: url)
        }
        return cell
    }
}

extension CollectionWithoutAVC: UICollectionViewDelegateFlowLayout {
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
