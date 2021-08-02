//
//  HomePresenter.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 18/06/2021.
//

import Foundation

protocol HomePertocol : AnyObject {
    
    func reloadBanner ()
    func realoadPageController()
    func reloadProduct ()
    func startSpinner()
    func endSpinner()
}

class VCHomeBanner {
        
   weak var delegat : HomePertocol?
    
    private var BannerModule = HomeBanner()
     var ProductModule = HomeModule()

//private var Banner = [AllBanners]()
    

    func retunNumOfArrarBanner()->Int {
        
        if self.BannerModule.status == true {
            return self.BannerModule.data!.count
        }
        else {return 0}
        
    }
    
    func retunNumOfProduct()->Int {
        if self.ProductModule.status == true {
            return self.ProductModule.data!.products!.count }
        else {return 0}
    }

    
    func TitleImage(index : Int ) -> AllBanners {
        
        return BannerModule.data![index] 
    }
    
    func dataProduct(index : Int ) -> AllProducts {
        
        return ProductModule.data!.products![index]
    }
    
   private let UrlBanner = URLApi.Banner
    
   private let UrlHome = URLApi.Home


    func viewdidloadBanner() {
        self.delegat?.startSpinner()
        API.fetchData(url: UrlBanner, methode:.get, Header: [:], responseClass: HomeBanner.self) { (response) in
            switch response {
            case .success(let users):
         //       print(users)
                if users?.status == true {
                self.BannerModule = users!
                self.delegat?.reloadBanner()
               self.delegat?.realoadPageController()
                    self.delegat?.endSpinner()


                }
                else {
            //        print(users?.message)
                }

            case .failure(_):
                self.delegat?.endSpinner()
                print("ERROR")
            }
        }

    }
    
    
    func ViewDidLoadProduct() {
        API.fetchData(url: UrlHome, methode:.get, Header: [:], responseClass: HomeModule.self) { (response) in
            switch response {
            case .success(let users):
                if users?.status == true {
                self.ProductModule = users!
                self.delegat?.reloadProduct()
                }
                else {
                }

            case .failure(_):
                print("ERROR")
            }
        }

    }
}
