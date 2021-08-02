//
//  LanguageCountryView.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 08/06/2021.
//

import UIKit

class LanguageCountryView: UIViewController , UITableViewDataSource , UITableViewDelegate, CustomCellCountry{
  
    

    @IBOutlet weak var CountryTableView: UITableView!
    
    
    
    internal var presneter = VCPreseneterCountry()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        SetupSplachCollection ()
        presneter.delegat = self
        presneter.viewdidload()
    }
  
    func reloadCellCountry() {
        self.CountryTableView.reloadData()

    }
        private func SetupSplachCollection () {
            CountryTableView.delegate = self
            CountryTableView.dataSource = self
            CountryTableView.register(UINib(nibName: "CountryCell", bundle: nil), forCellReuseIdentifier: "CellFlag")
        }

    @IBAction func ButNextLogin(_ sender: Any) {
        
        let VCCountry: SignInViewController = SignInViewController()
        self.navigationController!.pushViewController(VCCountry, animated: true)
        
    }
}
