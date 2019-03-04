//
//  TableViewWithAVC.swift
//  MMasterDemo
//
//  Created by Manish Sharma on 16/12/18.
//  Copyright © 2018 Manish Sharma. All rights reserved.
//

import UIKit
import RealmSwift

class TableViewWithAVC: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // Properties
    var commentsArray = [Comments]()
    var realm = try! Realm()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        fetchData()
    }

    // MARK: Custom Methods
    func fetchData() {
        let list = realm.objects(Comments.self)

        if list.count > 0 {
            for i in 0..<list.count {
                 commentsArray.append(list[i])
            }
        } else {
            // Fetch API Call
            let url = Constants.Urls.commentUrl
            APIManager().fetchForComments(urlString: url) { (comments) in
                self.commentsArray = comments
                self.tableView.reloadData()
            }
        }
    }

}

// MARK: TableView Data-source Methods
extension TableViewWithAVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CommentsCell
        cell.postId.text = String(commentsArray[indexPath.row].postId)
        cell.lblName.text = commentsArray[indexPath.row].name
        cell.lblEmail.text = commentsArray[indexPath.row].email
        cell.lblBody.text = commentsArray[indexPath.row].body
        return cell
    }

}

// MARK: TableView Delegate Methods
extension TableViewWithAVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
