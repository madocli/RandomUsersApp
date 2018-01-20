//
//  User.swift
//  RandomUsersApp
//
//  Created by Maria Donet Climent on 20/1/18.
//  Copyright © 2018 MariaDonet. All rights reserved.
//

import Foundation


struct User {
    let id = UUIDIdentityGenerator.newId()
    let userName: String
    let email: String
    let cell: String
    let pictureLarge: String
    let pictureThumbnail: String
    
    init(userName: String, email: String, cell: String, pictureL: String, pictureT: String) {
        self.userName = userName
        self.email = email
        self.cell = cell
        self.pictureLarge = pictureL
        self.pictureThumbnail = pictureT
    }
    
    init(randomUser: RandomUser) {
        self.userName = randomUser.fullName
        self.email = randomUser.email
        self.cell = randomUser.cell
        self.pictureLarge = randomUser.picture.large
        self.pictureThumbnail = randomUser.picture.thumbnail
    }
    
}
