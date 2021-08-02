//
//  ApiUser.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 08/06/2021.
//

import Foundation



protocol UsersAPIProtocol {
    func getUsers(completion: @escaping (Result<ResponseUser?, NSError>) -> Void)
}


class UsersAPI: BaseAPI<NetWorkingUser> ,UsersAPIProtocol {
    
    //MARK:- Requests
    
    func getUsers(completion: @escaping (Result<ResponseUser?, NSError>) -> Void) {
        self.fetchData(target: .CreateUser(name: "ss", phone: 111111111, email: "ssee@Gmail.com", password: 12345567, image: "dsfsdfsdfsdfsdfsdfsfsdfsfd"), responseClass: ResponseUser.self) { (result) in
            completion(result)
        }
    }
}
