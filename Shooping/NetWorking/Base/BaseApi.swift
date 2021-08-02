//
//  BaseApi.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 08/06/2021.
//

import Foundation
import Alamofire

class BaseAPI<T : Targettype> {
    
    func fetchData<M :Decodable> (target : T , responseClass: M.Type ,  completion:@escaping (Result<M?, NSError>) -> Void) {
        
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let headers = Alamofire.HTTPHeaders(target.headers ?? [:])
        let params = buildParams(task: target.task)
        
        AF.request(target.baseUrl + target.path, method: method, parameters: params.0, encoding: params.1, headers: headers).responseJSON { (response) in
            
            guard let stutesCode = response.response?.statusCode else {
                // ADD Custom Error
                let error = NSError(domain: target.baseUrl, code: 0, userInfo: [NSLocalizedDescriptionKey: ErroreMessage.generucErrore])
                completion(.failure(error))
                return
            }
            
                                
      //      if stutesCode as! Bool  ==  true { // 200 reflect success response
                // Successful request
                guard let jsonResponse = try? response.result.get() else {
                    // ADD Custom Error
                    let error = NSError(domain: target.baseUrl, code: 0, userInfo: [NSLocalizedDescriptionKey:ErroreMessage.generucErrore])
                    completion(.failure(error))
                    return
                }
                
                guard let theJSONData = try? JSONSerialization.data(withJSONObject: jsonResponse, options: []) else {
                    // ADD Custom Error
                    let error = NSError(domain: target.baseUrl, code: 0, userInfo: [NSLocalizedDescriptionKey: ErroreMessage.generucErrore])
                    completion(.failure(error))
                    return
                }
                guard let responseObj = try? JSONDecoder().decode(M.self, from: theJSONData) else {
                    // ADD Custom Error
                    let error = NSError(domain: target.baseUrl, code: 0, userInfo: [NSLocalizedDescriptionKey: ErroreMessage.generucErrore])
                    completion(.failure(error))
                    return
                }
  //      }
            
            
    }
}




private func buildParams(task: Task) -> ([String:Any], ParameterEncoding) {
    switch task {
    case .requestPlain:
        return ([:], URLEncoding.default)
    case .requestParameters(parameters: let parameters, encoding: let encoding):
        return (parameters, encoding)
    }
}
}
