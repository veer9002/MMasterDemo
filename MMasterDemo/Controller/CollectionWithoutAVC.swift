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

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchJson()
    }
    
    func fetchJson() {
        let urlString = Constants.Urls.photosUrl
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, err) in
            DispatchQueue.main.async {
                if let err = err {
                    print("Failed", err)
                    return
                }
                guard let data = data else { return }
                
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    self.dataArr = try decoder.decode([Photos].self, from: data)
                } catch let jsonErr  {
                    print("faield to decode", jsonErr)
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PhotosCell
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
