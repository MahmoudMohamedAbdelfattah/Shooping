//
//  presenter.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 08/06/2021.
//

import Foundation


protocol CustomCellProtocol : AnyObject {
    
    func rloadView ()
    func realoadPageController()
}


class VCPresenterSplach {
    
    
   weak var delegat : CustomCellProtocol?
    
   private var array : [ProgramingModulepresenter] = []
    
   
    func retunNumOfArrar()->Int {
        
        return array.count
    }
    
    
    func titleImageDesc(index : Int ) -> ProgramingModulepresenter {
        
        return array[index]
    }
    
    
    func viewdidload() {
    
        array.append(ProgramingModulepresenter(name: "عنوان قصير من 4 كلمات", titleDescripition: " مثال وصف للاعلان بشكل مختصر", image: "advartesment-1"))
       array.append(ProgramingModulepresenter(name: "عنوان قصير من 4 كtitleDescripition", titleDescripition: " مثال وصف للاعلان بشكل مختصر", image: "advartesment-1"))
       array.append(ProgramingModulepresenter(name: "عنوان قصير من 4 كلمات", titleDescripition: " مثال وصف للاعلان بشكل مختصر", image: "advartesment-1"))
       array.append(ProgramingModulepresenter(name: "عنوان قصير من 4 كلمات", titleDescripition: " مثال وصف للاعلان بشكل مختصر", image: "advartesment-1"))
       array.append(ProgramingModulepresenter(name: "عنوان قصير من 4 كلمات", titleDescripition: " مثال وصف للاعلان بشكل مختصر", image: "advartesment-1"))
       
        self.delegat?.rloadView()
        self.delegat?.realoadPageController()
    }
    
}

