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
        Alamofire.request(urlString).responseJSON { response in
          
            if response.response?.statusCode == 200 {
                guard let data = response.data else { return }
                
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let result = try decoder.decode([Photos].self, from: data)
                    DBHelper.shared.inserIntoDB(data: result)
                    completion(result)
                } catch {
                    print("Error \(error)")
                }
            } else {
                print("Error in fetching data.")
            }

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
    
    // Fetch comments data from server
    
    func fetchForComments(urlString: String, completion: @escaping ([Comments]) -> ()) {
        Alamofire.request(urlString).responseJSON { response in
            
            if response.response?.statusCode == 200 {
                guard let data = response.data else { return }
                
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let result = try decoder.decode([Comments].self, from: data)
                    DBHelper.shared.insertComments(data: result)
                    completion(result)
                } catch {
                    print("Error \(error)")
                }
            } else {
                print("Error in fetching data.")
            }
        }
    }
    
}
