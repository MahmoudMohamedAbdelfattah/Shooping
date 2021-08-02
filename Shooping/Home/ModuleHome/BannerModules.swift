//
//  Homemodule.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 18/06/2021.
//

import Foundation

struct HomeBanner : Decodable {
    
    var status : Bool?
    var message : String?
    var data:[AllBanners]?
}
struct AllBanners : Decodable {
    var id : Int?
    var image:String?
    var category : AllCategory?
}
struct AllCategory:Decodable {
    var id: Int?
    var image: String?
    var name: String?
    
}

