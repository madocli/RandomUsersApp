//
//  UseCaseFactory.swift
//  RandomUsersApp
//
//  Created by Maria Donet Climent on 20/1/18.
//  Copyright © 2018 MariaDonet. All rights reserved.
//

import Foundation



class UseCaseFactory {
    
    // MARK: - Properties
    
    let entityGateway: EntityGateway
    
    
    // MARK: - Initializer
    
    init(entityGateway: EntityGateway) {
        self.entityGateway = entityGateway
    }

    // MARK: - Factory methods
    func showUsersListUseCase(handler: @escaping Handler<[User]>) -> UseCase {
        return ShowUsersListUseCase(entityGateway: entityGateway, handler: handler)
    }
    
}
