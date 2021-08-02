//
//  MyViewClolor.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 18/06/2021.
//

import UIKit

class StackCircle: UIStackView {
    //let mylayer = CAGradientLayer()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.height/2
        self.clipsToBounds = true

    }
}
