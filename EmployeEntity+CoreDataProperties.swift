//
//  EmployeEntity+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by Haidar Bhatti on 21/02/2023.
//
//

import Foundation
import CoreData


extension EmployeEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EmployeEntity> {
        return NSFetchRequest<EmployeEntity>(entityName: "EmployeEntity")
    }

    @NSManaged public var name: String?

}

extension EmployeEntity : Identifiable {

}
