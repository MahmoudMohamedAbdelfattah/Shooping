//
//  RegisterModule.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 08/06/2021.
//

import Foundation

struct RegisterModule : Decodable{
    
    let status : Bool?
    let message : String?
    let data : DataToken?
}

struct DataToken  : Decodable{
    let name , phone , email : String?
    let id : Int?
    let image : String?
    let token : String?
}


struct LoginModule:Decodable{
    var status:Bool?
    var message :String?
    var data:DataLog?
}
struct DataLog:Decodable {
    var id:Int?
    var name:String?
    var email:String?
    var phone:String?
    var image:String?
    var points:Int?
    var credit :Int?
    var token:String?
    
}


struct MessageMain : Decodable {
    var status : Bool?
    var message : String?
    var data : String?
}

