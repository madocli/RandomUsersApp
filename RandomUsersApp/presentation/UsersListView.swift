//
//  UsersListView.swift
//  RandomUsersApp
//
//  Created by Maria Donet Climent on 20/1/18.
//  Copyright © 2018 MariaDonet. All rights reserved.
//

import Foundation


protocol UsersListView: class {
    func navigateToUserDetail()
    func refresh()
}
