//
//  ExtentionProductDeatial.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 23/06/2021.
//

import Foundation
import UIKit
extension HomeDetialsViewController {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return Module.images?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"cellProductDetial", for: indexPath) as! HomeProductDetialCee
        cell.AddInfoCelll(image: Module.images?[indexPath.row] ?? "")
        return cell
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        PageController.currentPage = Int( x / view.frame.width)

    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = ProductDetialImageCollection.frame.size.width
        let hight = ProductDetialImageCollection.frame.size.height
            return CGSize(width: width, height: hight)
            
        }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {

        coordinator.animate(alongsideTransition: { (_) in
         //   self.collectionViewLayout.invalidateLayout()
            if self.PageController.currentPage ==  0 {
                self.ProductDetialImageCollection.contentOffset = .zero
            } else {
                let indexpath = IndexPath(item: self.PageController.currentPage, section: 0)
                self.ProductDetialImageCollection.scrollToItem(at: indexpath, at: .centeredHorizontally, animated: true)
            }

        }) { (_) in

        }
    }
    
}
