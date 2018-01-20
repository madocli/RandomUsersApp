//
//  UsersListConnector.swift
//  RandomUsersApp
//
//  Created by Maria Donet Climent on 20/1/18.
//  Copyright © 2018 MariaDonet. All rights reserved.
//

import UIKit


class UsersListConnector {
    
    // MARK: - Properties
    
    private let entityGateway: EntityGateway
    
    // MARK: - Initializer
    
    init(entityGateway: EntityGateway) {
        self.entityGateway = entityGateway
    }
    
    // MARK: - Dependency injection
    
    func assembleModule(view: UsersTableViewController) {
        let useCaseFactory = UseCaseFactory(entityGateway: entityGateway)
        let presenter = UsersListPresenter(useCaseFactory: useCaseFactory)
        view.presenter = presenter
        view.connector = self
        presenter.view = view
    }

    
}
