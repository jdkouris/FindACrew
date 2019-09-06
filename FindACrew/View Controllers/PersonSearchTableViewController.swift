//
//  PersonSearchTableViewController.swift
//  FindACrew
//
//  Created by John Kouris on 9/5/19.
//  Copyright © 2019 John Kouris. All rights reserved.
//

import UIKit

class PersonSearchTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    private let personController = PersonController()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        searchBar.delegate = self
    }

}

extension PersonSearchTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}

extension PersonSearchTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }
        
        personController.searchForPeople(with: searchTerm) {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
}
