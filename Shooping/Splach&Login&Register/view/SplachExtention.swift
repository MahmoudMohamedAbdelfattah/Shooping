//
//  SplachExtention.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 08/06/2021.
//

import UIKit

extension SplachView {
    
   // var ss = SplachViewData()
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      //  return SplachViewData.arrayData.count
        
        return self.presneter.retunNumOfArrar()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = SplachCollecition.dequeueReusableCell(withReuseIdentifier:"CellSplash", for: indexPath) as! SplachCellCell
//        let data = SplachViewData.arrayData[indexPath.row]
//      cell.stupCellSplach(title:data.name, titleDes: data.titleDescripition, IMG: data.image)
        
        
        let data = self.presneter.titleImageDesc(index: indexPath.row)
        cell.AddInfoCell(namemodule: data)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = SplachCollecition.frame.size.width
        let hight = SplachCollecition.frame.size.height
        return CGSize(width: width, height: hight)
        
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        PageController.currentPage = Int( x / view.frame.width)

    }
  
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {


        coordinator.animate(alongsideTransition: { (_) in
         //   self.collectionViewLayout.invalidateLayout()

            if self.PageController.currentPage ==  0 {
                self.SplachCollecition.contentOffset = .zero
            }else {
                let indexpath = IndexPath(item: self.PageController.currentPage, section: 0)
                self.SplachCollecition.scrollToItem(at: indexpath, at: .centeredHorizontally, animated: true)
            }

        }) { (_) in

        }
    }
    
}
