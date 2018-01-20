//
//  ShowMoreUsersUseCase.swift
//  RandomUsersApp
//
//  Created by Maria Donet Climent on 20/1/18.
//  Copyright © 2018 MariaDonet. All rights reserved.
//

import Foundation

class ShowMoreUsersUseCase {
    
    // MARK: - Properties
    
    private let entityGateway: EntityGateway
    private let handler: Handler<[User]>
    
    
    // MARK: - Initializer
    
    init(entityGateway: EntityGateway, handler: @escaping Handler<[User]>) {
        self.entityGateway = entityGateway
        self.handler = handler
    }
    
}

extension ShowMoreUsersUseCase: UseCase {
    func execute() {
        entityGateway.fetchMoreUsers(handle: handler)
    }
    
}
