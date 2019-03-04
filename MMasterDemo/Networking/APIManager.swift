//
//  APIManager.swift
//  MMasterDemo
//
//  Created by Syon on 04/03/19.
//  Copyright © 2019 Manish Sharma. All rights reserved.
//

import Foundation
import Alamofire

class APIManager {
    
    // MARK: Fetch data with alamofire
    func fetchAPI(urlString: String, completion: @escaping ([Photos]) -> ()) {
//        let url = Constants.Urls.photosUrl
        Alamofire.request(urlString).responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            guard let data = response.data else {
                return
            }
         
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let result = try decoder.decode([Photos].self, from: data)
                _ = DBHelper.shared.inserIntoDB(data: result)
                completion(result)
            } catch {
                print("Error \(error)")
            }
           
            
//            if let json = response.result.value {
//                print("JSON: \(json)") // serialized json response
//                guard let jsonArray = json as? NSArray else { return print("Cannot convert json to error") }
//                print(jsonArray.count)
//
//                _ = DBHelper.shared.insertIntoDb(json: jsonArray)
//
//            }
        }
    }
    
    // MARK: Fetch data without alamofire and default apple class.
//    func getMoviesAPI(urlString: String, completion: @escaping ([Search]) -> ()) {
//
//        guard let url = URL(string: urlString) else { return }
//        URLSession.shared.dataTask(with: url) { (data, _, err) in
//            DispatchQueue.main.async {
//                if let err = err {
//                    print("Failed",err)
//                    return
//                }
//                guard let data = data else { return }
//
//                do {
//                    let decoder = JSONDecoder()
//                    decoder.keyDecodingStrategy = .convertFromSnakeCase
//                    let result = try decoder.decode(Movies.self, from: data)
//                    completion(result.Search)
//                } catch let jsonErr {
//                    print("Failed to decode", jsonErr)
//                }
//            }
//            }.resume()
//    }
    
    
}
