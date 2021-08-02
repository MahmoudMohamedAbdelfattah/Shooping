//
//  module.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 08/06/2021.
//

import Foundation
import UIKit


class ProgramingModule {
    
    var name :String
    var titleDescripition : String
    var image :UIImage
    
    init(name:String,titleDesc:String,image:UIImage) {
        self.name = name
        self.image = image
        self.titleDescripition = titleDesc
    }
}
