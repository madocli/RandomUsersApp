//
//  Handler.swift
//  RandomUsersApp
//
//  Created by Maria Donet Climent on 20/1/18.
//  Copyright © 2018 MariaDonet. All rights reserved.
//

import Foundation


typealias Handler<T> = (T) -> Void

typealias ServiceHandler = (Bool, AnyObject) -> Void
