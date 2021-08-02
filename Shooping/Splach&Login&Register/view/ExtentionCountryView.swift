//
//  ExtentionCountryView.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 08/06/2021.
//

import UIKit

extension LanguageCountryView  {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
        return self.presneter.retunNumOfArrar()
        }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CountryTableView.dequeueReusableCell(withIdentifier: "CellFlag", for: indexPath) as! CountryCell
        let data = self.presneter.AllInfo(index: indexPath.row)
        cell.AddInfoCell(namemodule: data)
        
        let backgroundview = UIView()
        backgroundview.backgroundColor = UIColor.orange
        cell.selectedBackgroundView = backgroundview

        if (indexPath.row) % 2 == 0  {
            cell.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1)
        }
        else {
            cell.backgroundColor = .white
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if  UIDevice.current.userInterfaceIdiom == .pad{

        return 80
        }
        return 50
    }
}

