//
//  UserListItemView.swift
//  RandomUsersApp
//
//  Created by Maria Donet Climent on 20/1/18.
//  Copyright © 2018 MariaDonet. All rights reserved.
//

import Foundation


protocol UserListItemView {
    func display(name: String)
    func display(email: String)
    func display(cell: String)
    func display(image: String)
}
