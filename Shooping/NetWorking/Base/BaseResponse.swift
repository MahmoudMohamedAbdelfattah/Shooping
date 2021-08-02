//
//  BaseResponse.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 08/06/2021.
//

import Foundation

struct ResponseUser : Codable {
    
    var data : loginmodel?
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
        
    }
}
