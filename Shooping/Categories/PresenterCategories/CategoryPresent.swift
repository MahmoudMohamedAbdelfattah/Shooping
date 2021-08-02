//
//  CategoryPresent.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 28/06/2021.
//

import Foundation


protocol PertocolCategories : AnyObject {
    func reloadTableCategories()
    func startSpinner()
    func endSpinner()
}

class CategoryPresent {
    
    weak var delegat : PertocolCategories?
    private var CategoryModulee = categoriesmodule()
    private var CategoriesDeatialModule = DeatialCategoriesModule()
    var IDCategories : Int?
//    
//    init (IDCategories: Int) {
//        self.IDCategories = IDCategories
//    }

    
    func returnNumberOfData()->Int {
        if self.CategoryModulee.status == true {
            return (self.CategoryModulee.data?.data!.count)!
        }
        else {return 0}
    }
    
    func TitleImage(index : Int ) -> DataInfo {
        
        return (CategoryModulee.data?.data![index])!
    }
    
    private let UrlCategories = URLApi.Categories
    func viewdidloadCAtegories() {
        self.delegat?.startSpinner()
        API.fetchData(url: UrlCategories, methode:.get, Header: [:], responseClass: categoriesmodule.self) { (response) in
            switch response {
            case .success(let users):
         //       print(users)
                if users?.status == true {
                self.CategoryModulee = users!
                self.delegat?.reloadTableCategories()
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

    func viewdidloadCAtegoriesDetails() {
        API.fetchData(url: "\(UrlCategories)/\(IDCategories)", methode:.get, Header: [:], responseClass: DeatialCategoriesModule.self) { [self] (response) in
            switch response {
            case .success(let users):
                print("\(self.UrlCategories)/\(String(describing: self.IDCategories))")
         //       print(users)
                if users?.status == true {
                self.CategoriesDeatialModule = users!
                    print(self.CategoriesDeatialModule)
              //  self.delegat?.reloadTableCategories()
                }
                else {
            //        print(users?.message)
                }

            case .failure(_):
                print("ERROR")
            }
        }

    }

}
