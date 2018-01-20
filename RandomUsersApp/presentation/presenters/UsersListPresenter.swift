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
    
    // Last item loaded
    var lastItemShown: Int?
    var isAtBottom = false
    
    
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
        let itemPosition = positionToRepresent(row: row)
        
        let user = users[itemPosition]
        
        cell.display(name: user.userName)
        cell.display(email: user.email)
        cell.display(cell: user.cell)
        cell.display(image: user.pictureLarge)
        
        isLastItem(row: row)
    }
    
    private func positionToRepresent(row: Int) -> Int {
        var itemPosition = row
        if (isAtBottom && lastItemShown != nil) {
            itemPosition = lastItemShown!
            isAtBottom = false
        }
        return itemPosition
    }
    
    private func isLastItem(row: Int) {
        if row == users.count - 1 {
            lastItemShown = row
            self.loadMore()
        }
    }
    
    private func loadMore() {
        let useCase = useCaseFactory.showMoreUsersUseCase { [weak self] users in
            self?.isAtBottom = true
            self?.users = users
            self?.view.refresh()
        }
        useCase.execute()
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
