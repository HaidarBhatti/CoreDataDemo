//
//  EmployeeManager.swift
//  CoreDataDemo
//
//  Created by Haidar Bhatti on 22/02/2023.
//

import Foundation

struct EmployeeManager{
    
    private let _employeeDataRepository = EmployeeDataRepository()
    
    func createEmployee(employee: Employee) {
        _employeeDataRepository.create(employee: employee)
    }
    
    func getEmployees() -> [Employee]? {
        return _employeeDataRepository.getAll()
    }
    
    func getEmployee(byIdentifier id: UUID) -> Employee? {
        return _employeeDataRepository.get(byIdentifier: id)
    }
    
    func updateEmployee(employee: Employee) -> Bool {
        return _employeeDataRepository.update(employee: employee)
    }
    
    func deleteEmployee(employee: Employee) -> Bool {
        return _employeeDataRepository.delete(record: employee)
    }
    
}
