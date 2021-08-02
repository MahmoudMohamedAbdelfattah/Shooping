//
//  PresenterCountry.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 08/06/2021.
//

import Foundation


protocol  CustomCellCountry : AnyObject {
    
    func reloadCellCountry ()
}

class VCPreseneterCountry {
    
    weak var delegat : CustomCellCountry?
     
    private var array : [ProgramingModulepresenter] = []
    
    func retunNumOfArrar()->Int {
        
        return array.count
    }
    
    func AllInfo(index : Int ) -> ProgramingModulepresenter {
        
        return array[index]
    }
    
    
    
    func viewdidload() {
    
        array.append(ProgramingModulepresenter(name: "السعوديه", titleDescripition: "", image: "SuadeFlag"))
       array.append(ProgramingModulepresenter(name: "مصر", titleDescripition: "", image: "flaeyg"))
        
        self.delegat?.reloadCellCountry()
    
}
}
