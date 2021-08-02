//
//  HomeDetialsViewController.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 23/06/2021.
//

import UIKit

class HomeDetialsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {
   
  

    
    
    
    @IBOutlet weak var FristView: UIView!
    @IBOutlet weak var DescripitionProductText: UITextView!
    
    @IBOutlet weak var PageController: UIPageControl!
    @IBOutlet weak var DescLbl: UILabel!
    @IBOutlet weak var ProductDetialImageCollection: UICollectionView!
    @IBOutlet weak var DescripitionProductLbl: UITextView!
    @IBOutlet weak var DescountProductLbl: UILabel!
    @IBOutlet weak var PriceProductLbl: UILabel!
    @IBOutlet weak var NameProductLbl: UILabel!
    
    var Module = AllProducts ()

    override func viewDidLoad() {
        super.viewDidLoad()
        SetupCollecition ()
//
//        let gg = Module.name
//        print(gg)
        self.NameProductLbl?.text = Module.name
        self.DescountProductLbl?.text = " % \(Module.discount!)"
        self.PriceProductLbl?.text = "\(Module.price!) جنيه"
        self.DescripitionProductLbl?.text = Module.description
        SetupPageController()
        DescripitionProductText.layer.borderColor = UIColor.black.cgColor
        DescripitionProductText.layer.borderWidth = 2
        DescripitionProductText.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }

    private func SetupCollecition () {
        ProductDetialImageCollection.delegate = self
        ProductDetialImageCollection.dataSource = self
        ProductDetialImageCollection?.register(UINib(nibName: "HomeProductDetialCee", bundle: nil), forCellWithReuseIdentifier: "cellProductDetial")
        ProductDetialImageCollection?.translatesAutoresizingMaskIntoConstraints = false
        ProductDetialImageCollection.layer.borderWidth = 2
        ProductDetialImageCollection.layer.borderColor = UIColor.purple.cgColor
        ProductDetialImageCollection.layer.cornerRadius = 10
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.ChangAutoCollectionCell), userInfo: nil, repeats: true)
       }
    }

    @IBAction func BakButton(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)

    }
    var timer = Timer()
    private var counter = 0
    
    @objc func ChangAutoCollectionCell ()
    {
        if counter < Module.images?.count ?? 0 {
            let index = IndexPath.init(item: counter, section: 0)
            self.ProductDetialImageCollection?.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            PageController?.currentPage = counter
            counter += 1
        } else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.ProductDetialImageCollection?.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            PageController?.currentPage = counter
        }
    }
    
    func SetupPageController() {
        PageController?.currentPage = 0
        PageController?.numberOfPages = Module.images?.count ?? 0
        PageController?.currentPageIndicatorTintColor = .orange
        PageController?.backgroundColor = .clear
        PageController?.pageIndicatorTintColor = .gray
        
}
    
}
