//
//  List+CoreDataProperties.swift
//  Ring Animation
//
//  Created by Ömer Faruk Kılıçaslan on 9.07.2022.
//
//

import Foundation
import CoreData


extension List {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<List> {
        return NSFetchRequest<List>(entityName: "List")
    }

    @NSManaged public var foodTitle: String?
    @NSManaged public var workoutTitle: String?
    @NSManaged public var foodCal: String?
    @NSManaged public var workoutDuration: String?

}

extension List : Identifiable {

}
