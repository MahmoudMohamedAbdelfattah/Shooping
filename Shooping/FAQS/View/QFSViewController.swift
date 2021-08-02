//
//  QFSViewController.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 04/07/2021.
//

import UIKit

class QFSViewController: UIViewController , UITableViewDelegate , UITableViewDataSource, PertocolFAQS {
    func startSpinner() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "spinner") as! ViewControllerSpinner
         vc.modalPresentationStyle = .overCurrentContext
         present(vc, animated: true, completion: nil)

    }
    
    func endSpinner() {
        dismiss(animated: true, completion: nil)
    }
    
  
    
  
    
    @IBOutlet weak var TableFAQ: UITableView!
  
    func ReloadTableFAQS() {
        self.TableFAQ?.reloadData()
    }
    
    internal var presneter = FAQSPresent()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presneter.delegat = self
        presneter.viewdidloadCAtegories()
        SetupTableQFAS()
    }


    private func SetupTableQFAS() {
        TableFAQ.delegate = self
        TableFAQ.dataSource = self
        TableFAQ.register(UINib(nibName: "FAQSCell", bundle: nil), forCellReuseIdentifier: "cellFAQ")
        self.navigationController?.navigationBar.isHidden = true
    }

}
