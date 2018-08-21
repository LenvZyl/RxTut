//
//  FavouritesViewController.swift
//  RxTut
//
//  Created by Len X van Zyl on 8/21/18.
//  Copyright © 2018 Len X van Zyl. All rights reserved.
//

import UIKit
import Firebase

class FavouritesViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var ref: DatabaseReference!
    var favourites = [String]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        ref = Database.database().reference()
        
        ref.child("favourites").observeSingleEvent(of : .value) { snapshot in
            for child in snapshot.children.allObjects as! [DataSnapshot] {
                let favMovieDict = child.value as? [String: String] ?? [:]
                if let favMovieTitle = favMovieDict["movie-title"] {
                    self.favourites.append(favMovieTitle)
                }
            }
        }
    }
}
extension FavouritesViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favourites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "FAV_CELL")!
        cell.textLabel?.text = favourites[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
