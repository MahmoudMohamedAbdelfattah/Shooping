//
//  CategoriesDeatialsPreseneter.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 28/06/2021.
//

import Foundation
protocol PertocolCategoriesDeatials : AnyObject {
    func reloadTableCategories()
    func startSpinner()
    func endSpinner()
}

class CategoryDeatialsPresent {
    
    weak var delegat : PertocolCategoriesDeatials?
    
    
     var CategoriesDeatialModule = DeatialCategoriesModule()
    
    var IDCategories : Int?
    init (IDCategories: Int) {
        viewdidloadCAtegoriesDetails(id: IDCategories)
    }

    
    func returnNumberOfData()->Int {
        if self.CategoriesDeatialModule.status == true {
            return (self.CategoriesDeatialModule.data?.data!.count)!
        }
        else {return 0}
    }
    
    func TitleImage(index : Int ) -> DataAll {
        return (CategoriesDeatialModule.data?.data![index])!
    }
    
    private let UrlCategories = URLApi.Categories
    
    func viewdidloadCAtegoriesDetails(id: Int) {
        self.delegat?.startSpinner()

        API.fetchData(url: "\(UrlCategories)/\(id)", methode:.get, Header: [:], responseClass: DeatialCategoriesModule.self) { [self] (response) in
            switch response {
            case .success(let users):
                if users?.status == true {
                self.CategoriesDeatialModule = users!
                self.delegat?.reloadTableCategories()
                    self.delegat?.endSpinner()

                }
                else {
                  // print(users?.data)
                }
            case .failure(_):
                self.delegat?.endSpinner()
                print("ERROR")
            }
        }

    }

}
