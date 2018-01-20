//
//  UsersListPresenter.swift
//  RandomUsersApp
//
//  Created by Maria Donet Climent on 20/1/18.
//  Copyright © 2018 MariaDonet. All rights reserved.
//

import Foundation


class UsersListPresenter {
    
    // MARK: - Properties
    
    private let useCaseFactory: UseCaseFactory
    weak var view: UsersListView!
    var numberOfUsers: Int {
        return users.count
    }
    private var users = [User]()
    var selectedId: String?
    
    
    // MARK: - Initializers
    
    init(useCaseFactory: UseCaseFactory) {
        self.useCaseFactory = useCaseFactory
    }
    
    
    // MARK: - Events
    
    func viewReady() {
        executeShowUserListUseCase()
    }
    
    private func executeShowUserListUseCase() {
        let useCase = useCaseFactory.showUsersListUseCase { [weak self] users in
            self?.users = users
            self?.view.refresh()
        }
        useCase.execute()
    }
    
    func configure(cell: UserListItemView, forRow row: Int) {
        let user = users[row]
        cell.display(name: user.userName)
        cell.display(email: user.email)
        cell.display(cell: user.cell)
        cell.display(image: user.pictureLarge)
    }
    
    func select(row: Int) {
        if row < 0 || row >= users.count {
            selectedId = nil
        } else {
            let user = users[row]
            selectedId = user.id
            view.navigateToUserDetail()
        }
    }
}
