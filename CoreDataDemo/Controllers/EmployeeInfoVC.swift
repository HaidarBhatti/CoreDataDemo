//
//  EmployeeInfoVC.swift
//  CoreDataDemo
//
//  Created by Haidar Bhatti on 23/02/2023.
//

import UIKit

class EmployeeInfoVC: UIViewController {

    @IBOutlet weak var ImageEmployee: UIImageView!
    @IBOutlet weak var lblName: UITextField!
    @IBOutlet weak var lblEmail: UITextField!
    
    var selectedEmployee: Employee?
    let manager = EmployeeManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        if let employee = selectedEmployee{
            ImageEmployee.image = UIImage(data: employee.profilePic!)
            lblName.text = employee.name
            lblEmail.text = employee.email
        }
    }
    
    @IBAction func onTapUpdate(_ sender: UIButton) {
        if let employee = selectedEmployee{
            let result = manager.updateEmployee(employee: Employee(name: lblName.text,
                                                      email: lblEmail.text,
                                                      id: employee.id,
                                                      profilePic: ImageEmployee.image?.pngData()))
            if result{
                print("success")
            }
            else{
                print("failure")
            }
        }
    }
    
    @IBAction func onTapDelete(_ sender: UIButton) {
        if let employee = selectedEmployee{
            if manager.deleteEmployee(id: employee.id){
                print("success")
                navigationController?.popViewController(animated: true)
            }
            else{
                print("failure")
            }
        }
    }

}
