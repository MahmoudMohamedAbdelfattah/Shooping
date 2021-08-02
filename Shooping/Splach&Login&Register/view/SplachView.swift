//
//  SplachView.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 08/06/2021.
//

import UIKit

class SplachView: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout, CustomCellProtocol {
    
    
    
    @IBOutlet weak var NextPageButton: UIButton!
    @IBOutlet var PageController: UIPageControl!
    @IBOutlet var SplachCollecition: UICollectionView!
    
    
   
                
    override func viewDidLoad() {
            super.viewDidLoad()
          
            SetupSplachCollection ()
            presneter.delegat = self
            presneter.viewdidload()
        }
    
    func rloadView() {
        
        self.SplachCollecition?.reloadData()
    }
    

        func realoadPageController() {
        
               PageController?.currentPage = 0
               PageController?.numberOfPages = presneter.retunNumOfArrar()
               PageController?.currentPageIndicatorTintColor = .orange
               PageController?.backgroundColor = .clear
               PageController?.pageIndicatorTintColor = .gray
    }
    
    
    internal var presneter = VCPresenterSplach()

        
    // Setup CollectionSplach
        private func SetupSplachCollection () {
            SplachCollecition?.delegate = self
            SplachCollecition?.dataSource = self
            SplachCollecition?.register(UINib(nibName: "SplachCellCell", bundle: nil), forCellWithReuseIdentifier: "CellSplash")
            self.navigationController?.navigationBar.isHidden = true
            SplachCollecition?.translatesAutoresizingMaskIntoConstraints = false
            SplachCollecition?.isPagingEnabled = true
            DispatchQueue.main.async {
                self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.ChangAutoCollectionCell), userInfo: nil, repeats: true)
            }
            
        }

    @IBAction func ButtNextView(_ sender: UIButton) {
        self.NextPageButton.backgroundColor = designSysytem.Colors.PrimaryButton.color
        self.NextPageButton.layer.borderColor = UIColor.black.cgColor
        self.NextPageButton.layer.borderWidth = 1
        let VCCountry: LanguageCountryView = LanguageCountryView()
        self.navigationController!.pushViewController(VCCountry, animated: true)
    }
    
    @IBAction func ButtNextSplach(_ sender: UIButton) {
        
        let nextIndex = min(PageController.currentPage + 1 , presneter.retunNumOfArrar()-1)
        let indexpath = IndexPath(item: nextIndex, section: 0)
        PageController.currentPage = nextIndex
        SplachCollecition?.scrollToItem(at: indexpath, at: .centeredHorizontally, animated: true)
    }
    
   
    
    

    private var timer = Timer()
   private var counter = 0

    
    @objc func ChangAutoCollectionCell ()
    {
        if counter < presneter.retunNumOfArrar() {
            let index = IndexPath.init(item: counter, section: 0)
            self.SplachCollecition?.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            PageController?.currentPage = counter
            counter += 1
        } else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.SplachCollecition?.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            PageController?.currentPage = counter
        }
    }

    }
