//
//  Font.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 06/07/2021.
//

import Foundation

enum Font : String {
    
    case regular = "Sukar Regular.ttf"
    case bold = "Sukar Bold.ttf"
    
    var name : String {
        return self.rawValue
    }
}
