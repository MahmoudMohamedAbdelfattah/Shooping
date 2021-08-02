//
//  ExtenitionCategories.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 28/06/2021.
//

import Foundation
import UIKit
import Kingfisher
extension CategoriesView {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.presneter.returnNumberOfData()

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CategoryTable.dequeueReusableCell(withIdentifier:"CellCategories", for: indexPath) as! CategoriesCell
        let data = self.presneter.TitleImage(index: indexPath.row)
        cell.AddInfoCell(NameModule: data)
        let Path = data.image!
        if let url = URL(string: Path) {
            cell.ImageProductCell.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"))
                }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        let tr : CategoriesDetailView = CategoriesDetailView(presenter: CategoryDeatialsPresent(IDCategories: self.presneter.TitleImage(index: indexPath.row).id ?? 0))
            self.navigationController!.pushViewController(tr, animated: true)
             print("lllllll")
    }
    
}
