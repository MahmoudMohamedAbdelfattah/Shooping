//
//  Colorr.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 06/07/2021.
//

import Foundation
import UIKit
  
extension designSysytem {
    
    enum Colors : String{
        case PrimaryButton = "PrimaryButtonColor"
        
        var color : UIColor {
            
            switch self {
            case .PrimaryButton:
                return UIColor(named: self.rawValue)!
            }
        }
    }
}
