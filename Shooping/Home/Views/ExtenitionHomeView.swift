//
//  ExtenitionHomeView.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 18/06/2021.
//

import Foundation
import UIKit
import Kingfisher
extension HomeViewController {
    
   // var ss = SplachViewData()
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag==0{
        return self.presneter.retunNumOfArrarBanner()
        } else {
            return self.presneter.retunNumOfProduct()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag==0 {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"cellBanner", for: indexPath) as! BannerCell
        let data = self.presneter.TitleImage(index: indexPath.row)
        cell.AddInfoCell(NameModule: data)
            let PathBannerImage = self.presneter.TitleImage(index: indexPath.row).category?.image! ?? ""
           if let UrlImage = URL(string: PathBannerImage) {
                cell.ImageBanner.kf.setImage(with: UrlImage, placeholder: UIImage(named: "placeholder"))
            }
        return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"CellProductHome", for: indexPath) as! HomeProduectCell
            let data = self.presneter.dataProduct(index: indexPath.row)
            cell.AddInfoCelll(NameModule: data)
           
            let Path = self.presneter.dataProduct(index: indexPath.row).image!
            if let url = URL(string: Path) {
                cell.ImageProduct.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"))
                    }
            return cell

        }
      
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 0 {
        let width = BannerCollecition.frame.size.width
        let hight = BannerCollecition.frame.size.height
            return CGSize(width: width, height: hight)}
        else {
            let width = CollecitionProductHome.frame.size.width
            let hight = CollecitionProductHome.frame.size.height
                return CGSize(width: width, height: hight)}
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 1 {
        let VCCountry: HomeDetialsViewController = HomeDetialsViewController()
            VCCountry.Module = self.presneter.dataProduct(index: indexPath.row)
        self.navigationController!.pushViewController(VCCountry, animated: true)
        } 
    }
    
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//            if collectionView === BannerCollecition {
//                timer?.invalidate()
//                timer = nil
//                timer = Timer.scheduledTimer(withTimeInterval: 3.5, repeats: true, block: { [weak self] (_) in
//                    self?.currentSliderIndex.item = ( ((self?.currentSliderIndex.item ?? 0) + 1) % (self?.presneter.retunNumOfArrarBanner() ?? 1) )
//                    self?.BannerCollecition.scrollToItem(at: self?.currentSliderIndex ?? IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: true)
//                    let index = self?.currentSliderIndex.item
//                    self?.PageControll.currentPage = index ?? 0
//                           
//                })
//            }
//        }
//        
//        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//            if !scrollView.showsHorizontalScrollIndicator {
//                let index = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
//                self.PageControll.currentPage = index
//               
//            }
//        }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        PageControll.currentPage = Int( x / view.frame.width)

    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {

        coordinator.animate(alongsideTransition: { (_) in
         //   self.collectionViewLayout.invalidateLayout()
            if self.PageControll.currentPage ==  0 {
                self.BannerCollecition.contentOffset = .zero
            }else {
                let indexpath = IndexPath(item: self.PageControll.currentPage, section: 0)
                self.BannerCollecition.scrollToItem(at: indexpath, at: .centeredHorizontally, animated: true)
            }

        }) { (_) in

        }
    }
        
    }


