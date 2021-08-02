//
//  UserNetworking.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 08/06/2021.
//

import Foundation
import Alamofire

enum NetWorkingUser {
    case CreateUser(name : String , phone : Int , email : String , password :Int , image : String)
}

extension NetWorkingUser : Targettype {
    var baseUrl: String {
        switch self {
       
        default:
            return "https://student.valuxapps.com/api"
        }
    }
    
    var path: String {
        switch self {
       
        case .CreateUser:
            return "/register"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .CreateUser:
            return .post
        }
    }
    
   // var sss : [String : Any] = []
    var task: Task {
        
        switch self {
        case .CreateUser(let name,let phone ,let email,let password,let image):
            return .requestParameters(parameters: ["name":name,"phone":phone ,"email":email,"password" :password,"image":image],encoding: JSONEncoding.default)
        
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
    }
    
    
}
