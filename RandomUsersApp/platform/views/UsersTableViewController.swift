//
//  ViewController.swift
//  RandomUsersApp
//
//  Created by Maria Donet Climent on 20/1/18.
//  Copyright © 2018 MariaDonet. All rights reserved.
//

import UIKit

class UsersTableViewController: UITableViewController {

    // MARK: - Constants
    
    static let ID = "UsersTableViewController"
    
    
    // MARK: - Properties
    var presenter: UsersListPresenter!
    var connector: UsersListConnector!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewReady()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfUsers
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UsersTableViewCell.ID, for: indexPath) as! UsersTableViewCell
        
        presenter.configure(cell: cell, forRow: indexPath.row)
        
        return cell
    }
 
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
    // MARK: Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.select(row: indexPath.row)
    }
}

extension UsersTableViewController: UsersListView {
    func navigateToUserDetail() {
        // TODO
    }
    
    func refresh() {
        self.tableView.reloadData()
    }
    
}
