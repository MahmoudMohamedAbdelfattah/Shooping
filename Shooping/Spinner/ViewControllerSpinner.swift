//
//  ViewControllerSpinner.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 28/07/2021.
//

import UIKit

class ViewControllerSpinner: UIViewController {

    @IBOutlet weak var SpinnerInducoter: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()

        SpinnerInducoter.startAnimating()
    }
    



}
