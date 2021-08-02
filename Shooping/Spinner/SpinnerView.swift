//
//  SpinnerView.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 28/07/2021.
//

import UIKit

class SpinnerView: UIViewController {

    @IBOutlet weak var SpinnerActivity: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SpinnerActivity.startAnimating()

        
    }


  

}
