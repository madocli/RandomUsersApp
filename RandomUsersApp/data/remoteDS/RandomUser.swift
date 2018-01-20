//
//  RandomUser.swift
//  RandomUsersApp
//
//  Created by Maria Donet Climent on 20/1/18.
//  Copyright © 2018 MariaDonet. All rights reserved.
//

import Foundation

struct RandomUser {
    
    var gender = ""
    var name: UserName = UserName()
    var email = ""
    var picture: UserPicture = UserPicture()
    
    
    init(gender: String, name: UserName, email: String, picture: UserPicture) {
        self.gender = gender
        self.name = name
        self.email = email
        self.picture = picture
    }
    
    init (json: NSDictionary) {
        if json[Constants.Random.gender] != nil {
            self.gender = json[Constants.Random.gender] as! String
        }
        if json[Constants.Random.name] != nil {
            self.name = UserName(json: json[Constants.Random.name] as! NSDictionary)
        }
        if json[Constants.Random.email] != nil {
            self.email = json[Constants.Random.email] as! String
        }
        if json[Constants.Random.picture] != nil {
            self.picture = UserPicture(json: json[Constants.Random.picture] as! NSDictionary)
        }
    }
    
}

struct UserName {
    var first = ""
    var last = ""
    
    init() {
    }
    
    init(json: NSDictionary) {
        if json[Constants.Random.first] != nil {
            self.first = json[Constants.Random.first] as! String
        }
        if json[Constants.Random.last] != nil {
            self.last = json[Constants.Random.last] as! String
        }
    }
}

struct UserPicture {
    var large = ""
    var thumbnail = ""
    
    init() {
    }
    
    init(json: NSDictionary) {
        if json[Constants.Random.large] != nil {
            self.large = json[Constants.Random.large] as! String
        }
        if json[Constants.Random.thumbnail] != nil {
            self.thumbnail = json[Constants.Random.thumbnail] as! String
        }
    }
}
