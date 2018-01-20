//
//  RemoteDataSource.swift
//  RandomUsersApp
//
//  Created by Maria Donet Climent on 20/1/18.
//  Copyright © 2018 MariaDonet. All rights reserved.
//

import Foundation

class RemoteDataSource {
    
    let service: RandomUserService
    var arrayRandomUsers: [RandomUser] = []
    
    init(randomService: RandomUserService) {
        self.service = randomService
    }
    
    // Cada vez que hagamos un fetch, realizaremos la llamada al servicio para conseguir NUEVOS usuariosRandom
    func fetchUsers(handle: @escaping Handler<[User]>) {
        var arrayUsers: [User] = []
        fetchRandomUsers { (randomUsers) in
            // si la respuesta ha sido correcta habrá al menos más de un objeto dentro de la respuesta
            if randomUsers.count > 0 {
                // filtramos primero los usuarios de GÉNERO FEMENINO
                let femalesArray = randomUsers.filter({ $0.gender == Constants.femaleGender })
                // mapeamos para obtener la ENTIDAD de nuestro DOMINIO
                arrayUsers = femalesArray.map({ User.init(randomUser: $0) })
            }
            
            // devolvemos el "handle" después de obtener la respuesta del servicio.
            handle(arrayUsers)
        }
    }
    
    fileprivate func fetchRandomUsers(handle: @escaping Handler<[RandomUser]>) {
        service.makePetition { (didPetition, response) in
            if didPetition {
                let json = response as? [NSDictionary]
                if json != nil {
                    for element in json! {
                        let userRandom = RandomUser(json: element)
                        self.arrayRandomUsers.append(userRandom)
                    }
                }
                handle(self.arrayRandomUsers)
            }
        }
    }
}
