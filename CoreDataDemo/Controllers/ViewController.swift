//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Haidar Bhatti on 21/02/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createEmploye()
        fetchEmploye()
    }

    func createEmploye(){
        let employeEntity = EmployeEntity(context: PersistantStorage.shared.context)
        employeEntity.name = "sanan"
        PersistantStorage.shared.saveContext()
    }
    
    func fetchEmploye(){
        do {
            guard let employeesData = try PersistantStorage.shared.context.fetch(EmployeEntity.fetchRequest()) as? [EmployeEntity] else { return }
            employeesData.forEach { debugPrint($0.name)}
        } catch let error {
            debugPrint(error)
        }
        
    }

}

