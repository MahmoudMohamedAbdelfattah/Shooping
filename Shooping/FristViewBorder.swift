//
//  FristViewBorder.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 28/07/2021.
//

import Foundation
import UIKit
class DesignView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.white.cgColor
        self.clipsToBounds = true
    }
}
