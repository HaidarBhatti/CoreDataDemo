//
//  CDEmploye+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by Haidar Bhatti on 21/02/2023.
//
//

import Foundation
import CoreData


extension CDEmploye {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDEmploye> {
        return NSFetchRequest<CDEmploye>(entityName: "CDEmploye")
    }

    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var id: UUID?
    @NSManaged public var profilePic: Data?

    func convertToEmployee() -> Employee{
        Employee(name: self.name, email: self.email, id: self.id!, profilePic: self.profilePic)
    }
    
}

extension CDEmploye : Identifiable {

}
