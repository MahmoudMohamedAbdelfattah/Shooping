//
//  TargetType.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 08/06/2021.
//

import Foundation
import Alamofire


enum HTTPMethod : String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum Task {
    // No parameter
    case requestPlain
    // add parameter
    case requestParameters(parameters : [String : Any] , encoding : ParameterEncoding)
}


protocol Targettype {
    // The targetbase 'URL'
    var baseUrl : String {get}
    // The Path to be
    var path : String {get}
    // TheHTTP methode used in the request
    var method  : HTTPMethod {get}
    // Task
    var task : Task {get}
    // the header to be  used in the request
    var headers : [String : String]? {get}
}
