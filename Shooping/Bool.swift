//
//  Bool.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 18/06/2021.
//

import Foundation


extension Bool {
    var toInt : Int {
        return NSNumber(booleanLiteral: self).intValue
    }
}
