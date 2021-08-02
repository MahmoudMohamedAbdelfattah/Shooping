//
//  HomeViewController.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 18/06/2021.
//

import UIKit

class HomeViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout, HomePertocol {
    
    func startSpinner() {
       let vc = storyboard?.instantiateViewController(withIdentifier: "spinner") as! ViewControllerSpinner
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true, completion: nil)
    }
    
    func endSpinner() {
        dismiss(animated: true, completion: nil)
    }
    

 
   
    @IBOutlet weak var FristView: UIView!
    @IBOutlet weak var PageControll: UIPageControl!
    @IBOutlet weak var BannerCollecition: UICollectionView!
    @IBOutlet weak var CollecitionProductHome: UICollectionView!
    
    var BannerModule = HomeBanner()
    var Module = [AllProducts] ()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupCollecition ()
        presneter.delegat = self
        presneter.viewdidloadBanner()
        presneter.ViewDidLoadProduct()
    }
    
    
    func reloadBanner() {
        self.BannerCollecition?.reloadData()
    }
    func reloadProduct() {
        self.CollecitionProductHome?.reloadData()
    }
    func realoadPageController() {
        PageControll?.currentPage = 0
        PageControll?.numberOfPages = presneter.retunNumOfArrarBanner()
        PageControll?.currentPageIndicatorTintColor = .orange
        PageControll?.backgroundColor = .clear
        PageControll?.pageIndicatorTintColor = .gray
}

    internal var presneter = VCHomeBanner()


    private func SetupCollecition () {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        BannerCollecition.delegate = self
        BannerCollecition.dataSource = self
        BannerCollecition?.register(UINib(nibName: "BannerCell", bundle: nil), forCellWithReuseIdentifier: "cellBanner")
        BannerCollecition.layer.borderWidth = 2
        BannerCollecition.layer.borderColor = UIColor.purple.cgColor
        BannerCollecition.layer.cornerRadius = 10
        layout.minimumInteritemSpacing = 5
    //  layout.minimumLineSpacing = 5
        
        CollecitionProductHome.delegate = self
        CollecitionProductHome.dataSource = self
        CollecitionProductHome?.register(UINib(nibName: "HomeProduectCell", bundle: nil), forCellWithReuseIdentifier: "CellProductHome")
        self.navigationController?.navigationBar.isHidden = true
        BannerCollecition?.translatesAutoresizingMaskIntoConstraints = false
    //    BannerCollecition?.isPagingEnabled = true
     //   self.BannerCollecition.bounces = true
 
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.ChangAutoCollectionCell), userInfo: nil, repeats: true)
       }
    }
//        var timer: Timer?
//        var currentSliderIndex = IndexPath(item: 0, section: 0)
   var timer = Timer()
   private var counter = 0
    
    @objc func ChangAutoCollectionCell ()
    {
        if counter < presneter.retunNumOfArrarBanner() {
            let index = IndexPath.init(item: counter, section: 0)
            self.BannerCollecition?.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            PageControll?.currentPage = counter
            counter += 1
        } else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.BannerCollecition?.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            PageControll?.currentPage = counter
        }
    }
}
