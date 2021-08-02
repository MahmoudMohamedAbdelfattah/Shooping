//
//  ExtenitionFAQS.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 05/07/2021.
//

import UIKit

extension QFSViewController  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presneter.returnNumberOfData()

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableFAQ.dequeueReusableCell(withIdentifier:"cellFAQ", for: indexPath) as! FAQSCell
        let data = self.presneter.TitleImage(index: indexPath.row)
        cell.AddInfoCell(NameModule: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 340
    }
    
}
