//
//  BaseService.swift
//  RandomUsersApp
//
//  Created by Maria Donet Climent on 20/1/18.
//  Copyright © 2018 MariaDonet. All rights reserved.
//

import Foundation
import Alamofire

class RandomUserService {
    
    var alamoRequest: Alamofire.Request?
    let url: URLConvertible = Constants.url
    
    func makePetition(handle:@escaping (Bool, AnyObject) -> Void) {
        alamoRequest = Alamofire.request(
            url,
            method: .get,
            parameters: nil,
            encoding: JSONEncoding.default,
            headers: nil)
            .responseJSON { response in
                if (response.response != nil){
                    switch (response.response!.statusCode) {
                    case 200, 201:
                        handle(true, response.result.value as AnyObject)
                        break
                    default:
                        print("Response: \(String(describing: response.result.value))")
                        
                        handle(false, "Something went wrong" as AnyObject)
                        break
                    }
                }else {
                    handle(false, "Server error" as AnyObject)
                }
                
        }
        
    }
    
}
