//
//  UserRepository.swift
//  RandomUsersApp
//
//  Created by Maria Donet Climent on 20/1/18.
//  Copyright © 2018 MariaDonet. All rights reserved.
//

import Foundation


class UserRepository {
    
    private let remoteDataSource: RemoteDataSource
    private var users: [User] = []
    
    init(remoteDS: RemoteDataSource) {
        self.remoteDataSource = remoteDS
    }
    
}


extension UserRepository: EntityGateway {
    func fetchUsers(handle: @escaping ([User]) -> Void) {
        if (users.count > 0) {
            handle(users)
        } else {
            remoteDataSource.fetchUsers(handle: { (users) in
                self.users = users
                handle(self.users)
            })
        }
    }
    
    func fetchMoreUsers(handle: @escaping ([User]) -> Void) {
        remoteDataSource.fetchUsers { (moreUsers) in
            self.users.append(contentsOf: moreUsers)
            handle(self.users)
        }
    }
    
}
