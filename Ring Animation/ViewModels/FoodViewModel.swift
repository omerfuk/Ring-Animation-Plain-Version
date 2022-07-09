//
//  FoodViewModel.swift
//  Ring Animation
//
//  Created by Ömer Faruk Kılıçaslan on 9.07.2022.
//

import Foundation
import CoreData

class FoodViewModel {
    
    let coreDataHelper = CoreDataHelper()
    
    var foodArray = [List]()
    var calArray = [List]()
    
    
    func fetchData() {
        
        foodArray = coreDataHelper.fetchData() ?? [List]()
        calArray = coreDataHelper.fetchData() ?? [List]()
    }
    
    
    func saveData(foodTitle:String, foodCal:String) {
        
        coreDataHelper.saveData(foodTitle: foodTitle, foodCal: foodCal)
        
    }
    
    
    func deleteData(index:Int) {
        
        coreDataHelper.deleteData(index: index)
        
    }
}
