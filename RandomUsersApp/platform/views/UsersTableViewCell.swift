//
//  UsersTableViewCell.swift
//  RandomUsersApp
//
//  Created by Maria Donet Climent on 20/1/18.
//  Copyright © 2018 MariaDonet. All rights reserved.
//

import UIKit

class UsersTableViewCell: UITableViewCell {

    // MARK: - Constants
    
    static let ID = "UsersCell"
    
    
    // MARK: - Properties
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userCell: UILabel!
    
    
}

extension UsersTableViewCell: UserListItemView {
    func display(name: String) {
        self.userName.text = name
    }
    
    func display(email: String) {
        self.userEmail.text = email
    }
    
    func display(cell: String) {
        self.userCell.text = cell
    }
    
    func display(image: String) {
        // TODO
    }
    
}
