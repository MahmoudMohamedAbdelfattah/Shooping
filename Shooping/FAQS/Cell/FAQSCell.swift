//
//  FAQSCell.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 05/07/2021.
//

import UIKit

class FAQSCell: UITableViewCell {

    @IBOutlet weak var QuesLbl: UILabel!
    @IBOutlet weak var AnswerLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func AddInfoCell (NameModule : ALLData) {
        QuesLbl.text = NameModule.question
        AnswerLbl.text = NameModule.answer
        print("cellllllll")
    }
    
}
