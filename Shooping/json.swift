//
//  json.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 18/06/2021.
import SwiftyJSON
import Foundation


import SwiftyJSON


extension JSON {
    
    
    var toBool : Bool?{
        if let bool = self.bool {return bool}
        if let int = self.toInt {
            if int == 0 {
                return false
            } else if int == 1 {
                return true
            }
        }
       
        return nil
    }
    
    var toInt: Int? {
        if let int = self.int {return int}
        if let string = self.string , let int = Int(string){
        return int
    }
    return nil

   }
    
//    var toImagePath : String? {
//        guard let string = self.string ,!string.isEmpty else {return nil}
//      //  return URLS.Image_Root + string
//        
//    }
}
