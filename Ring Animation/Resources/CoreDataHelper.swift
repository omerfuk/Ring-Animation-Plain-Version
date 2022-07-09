//
//  CoreDataHelper.swift
//  Ring Animation
//
//  Created by Ömer Faruk Kılıçaslan on 9.07.2022.
//

import Foundation
import UIKit


class CoreDataHelper {
    
    static let shared = CoreDataHelper()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func fetchData() -> [List]? {
        
        do {
            return try self.context.fetch(List.fetchRequest())
        } catch  {
            print(error.localizedDescription)
        }
        
        return nil
        
    }
    
    
    func saveData(foodTitle: String, foodCal: String) {
        
        let foodList = List(context: context)
        foodList.foodTitle = foodTitle
        foodList.foodCal = foodCal
        
        
        do {
            try self.context.save()
        } catch  {
            print(error.localizedDescription)
        }
        
    }
    
    
    func deleteData(index: Int) {
        
        if let dataArray = fetchData() {
            
            context.delete(dataArray[index])
            
            do {
                try self.context.save()
            } catch  {
                print(error.localizedDescription)
            }
        }
        
    }
    
}
