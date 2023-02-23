//
//  EmployeeDataRepository.swift
//  CoreDataDemo
//
//  Created by Haidar Bhatti on 21/02/2023.
//

import Foundation
import CoreData
import UIKit

protocol EmployeeRepository{
    func create(employee: Employee)
    func getAll() -> [Employee]?
    func get(byIdentifier id: UUID) -> Employee?
    func update(employee: Employee) -> Bool
    func delete(id: UUID) -> Bool
}

struct EmployeeDataRepository: EmployeeRepository{
    func create(employee: Employee) {
        let cdEmployee = CDEmploye(context: PersistantStorage.shared.context)
        cdEmployee.id = employee.id
        cdEmployee.name = employee.name
        cdEmployee.email = employee.email
        cdEmployee.profilePic = employee.profilePic
        PersistantStorage.shared.saveContext()
    }
    
    func getAll() -> [Employee]? {
        let result = PersistantStorage.shared.fetchManagedObject(managedObject: CDEmploye.self)
        var allEmployees: [Employee] = []
        result?.forEach({ employee in
            allEmployees.append(employee.convertToEmployee())
        })
        return allEmployees
    }
    
    func get(byIdentifier id: UUID) -> Employee? {
        let result = getCDEmployee(byIdentifier: id)
        guard result != nil else { return nil }
        return result?.convertToEmployee()
    }
    
    func update(employee: Employee) -> Bool {
        let cdEmployee = getCDEmployee(byIdentifier: employee.id)
        guard cdEmployee != nil else { return false }
        cdEmployee?.profilePic = employee.profilePic
        cdEmployee?.name = employee.name
        cdEmployee?.email = employee.email
        PersistantStorage.shared.saveContext()
        return true
    }
    
    func delete(id: UUID) -> Bool {
        let cdEmployee = getCDEmployee(byIdentifier: id)
        guard cdEmployee != nil else { return false }
        PersistantStorage.shared.context.delete(cdEmployee!)
        return true
    }
    
    private func getCDEmployee(byIdentifier id: UUID) -> CDEmploye?{
        let fetchRequest = NSFetchRequest<CDEmploye>(entityName: "CDEmploye")
        let predicate = NSPredicate(format: "id==%@", id as CVarArg)
        fetchRequest.predicate = predicate
        do {
            let result = try PersistantStorage.shared.context.fetch(fetchRequest).first
            guard result != nil else { return nil }
            return result
        } catch let error {
            debugPrint(error)
        }
        return nil
    }
}
