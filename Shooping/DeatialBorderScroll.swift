//
//  DeatialBorderScroll.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 27/07/2021.
//

import UIKit

class Deatialborderscrol: UIScrollView {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.white.cgColor
        self.clipsToBounds = true
    }
}
