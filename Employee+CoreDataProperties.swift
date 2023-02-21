//
//  Employee+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by Haidar Bhatti on 21/02/2023.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var name: String?

}

extension Employee : Identifiable {

}
