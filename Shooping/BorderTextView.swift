//
//  BorderText.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 16/07/2021.
//

import UIKit

class BorderViewText: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.gray.cgColor
        self.clipsToBounds = true
        
    }

}
