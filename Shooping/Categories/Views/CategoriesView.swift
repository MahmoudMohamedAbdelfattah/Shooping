//
//  CategoriesView.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 27/06/2021.
//

import UIKit

class CategoriesView: UIViewController , PertocolCategories, UITableViewDelegate, UITableViewDataSource{
 
    @IBOutlet weak var FristView: UIView!
    
    func reloadTableCategories() {
        self.CategoryTable?.reloadData()
    }
    

    @IBOutlet weak var CategoryTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presneter.delegat = self
        presneter.viewdidloadCAtegories()
        SetupTableCategories()
    }
    internal var presneter = CategoryPresent()

    private func SetupTableCategories(){
        CategoryTable.delegate = self
        CategoryTable.dataSource = self
        CategoryTable.register(UINib(nibName: "CategoriesCell", bundle: nil), forCellReuseIdentifier: "CellCategories")
        self.navigationController?.navigationBar.isHidden = true
    

    }
    func startSpinner() {
       let vc = storyboard?.instantiateViewController(withIdentifier: "spinner") as! ViewControllerSpinner
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true, completion: nil)
    }
    
    func endSpinner() {
        dismiss(animated: true, completion: nil)
    }
}
