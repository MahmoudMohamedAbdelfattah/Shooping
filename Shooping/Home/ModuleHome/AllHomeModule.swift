//
//  AllHomeModule.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 22/06/2021.
//

import Foundation



struct HomeModule : Decodable {
    
    var status : Bool?
    var message : String?
    var data: Alldata?
}

struct Alldata : Decodable {
    
    var banners : [AllBannerss]?
    var products: [AllProducts]?
    var ad : String?

}

struct AllBannerss : Decodable {
    var id : Int?
    var image:String?
    var category :AllCategoryy?
    
}
struct AllCategoryy: Decodable {
    var id: Int?
    var image: String?
    var name: String?
}
struct AllProducts:Decodable {
    var id: Int?
    var  price : Double?
    var oldPrice: Double?
    var discount: Int?
    var image: String?
    var name: String?
    var description: String?
    var images: [String]?
    var inFavorites :Bool?
    var inCart: Bool?
}
