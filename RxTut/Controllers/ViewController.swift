//
//  ViewController.swift
//  RxTut
//
//  Created by Len X van Zyl on 8/20/18.
//  Copyright © 2018 Len X van Zyl. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    var movies: [String]  = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.rx.text
            .orEmpty
            .distinctUntilChanged()
            .filter{ !$0.isEmpty }
            .throttle(0.5, scheduler: MainScheduler.instance)
            .subscribe(onNext: { query in
                let url = "https://www.omdbapi.com/?i=tt3896198&apikey=5af000b8&s=" + query
                
                Alamofire.request(url).responseJSON(completionHandler: { response in
                    if let value = response.result.value {
                        let json = JSON(value)
                        self.movies.removeAll()
                        for movie in json["Search"] {
                            if let title = movie.1["Title"].string {
                               self.movies.append(title)
                            }
                        }
                    }
                    self.tableView.reloadData()
                })
            }
        )
    }

    


}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "CELL")!
        cell.textLabel?.text = movies[indexPath.row]
        return cell
    }
}

