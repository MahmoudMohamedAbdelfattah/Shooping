//
//  helper.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 10/06/2021.
//

import Foundation

class helper : NSObject {
    
    class func saveApiToken (token : String){
        let def = UserDefaults.standard
        def.setValue(token, forKey: "api_token")
        def.synchronize()
    }
    
    class func getApiToken()-> String? {
    let def = UserDefaults.standard
    return def.object(forKey: "api_token") as? String
    }
}
