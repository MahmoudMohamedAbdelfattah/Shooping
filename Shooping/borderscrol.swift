//
//  borderscrol.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 11/07/2021.
//

import UIKit

class borderscrol: UIScrollView {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.purple.cgColor
        self.clipsToBounds = true
    }
}
