//
//  EntityGateway.swift
//  RandomUsersApp
//
//  Created by Maria Donet Climent on 20/1/18.
//  Copyright © 2018 MariaDonet. All rights reserved.
//

import Foundation


protocol EntityGateway {
    func fetchUsers(handle: @escaping Handler<[User]>)
    func fetchMoreUsers(handle: @escaping Handler<[User]>)
}
