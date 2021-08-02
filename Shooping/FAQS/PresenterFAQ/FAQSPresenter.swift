//
//  FAQSPresenter.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 04/07/2021.
//

import Foundation

protocol PertocolFAQS : AnyObject {
    func ReloadTableFAQS()
    func startSpinner()
    func endSpinner()
}

class FAQSPresent {
    
    weak var delegat : PertocolFAQS?
    private var ModuleeFaqs = FAQSModule()
    
    func returnNumberOfData()->Int {
        if self.ModuleeFaqs.status == true {
            return (self.ModuleeFaqs.data?.data!.count)!
        }
        else {return 0}
    }
    func TitleImage(index : Int ) -> ALLData {
        
        return (ModuleeFaqs.data?.data![index])!
    }
    
    private let UrlFQS = URLApi.FAQSS
    func viewdidloadCAtegories() {
        self.delegat?.startSpinner()
        API.fetchData(url: UrlFQS, methode:.get, Header: [:], responseClass: FAQSModule.self) { (response) in
            switch response {
            case .success(let users):
         //       print(users)
                if users?.status == true {
                self.ModuleeFaqs = users!
                self.delegat?.ReloadTableFAQS()
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
    
}
