//
//  allEmployeesVC.swift
//  CoreDataDemo
//
//  Created by Haidar Bhatti on 23/02/2023.
//

import UIKit

class allEmployeesVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let employeeManager = EmployeeManager()
    var allEmployees = [Employee]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "EmployeeTableViewCell", bundle: nil), forCellReuseIdentifier: "EmployeeTableViewCell")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let allEmployees = employeeManager.getEmployees(){
            self.allEmployees = allEmployees
            tableView.reloadData()
        }
    }
}
extension allEmployeesVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allEmployees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeTableViewCell", for: indexPath) as! EmployeeTableViewCell
        let data = allEmployees[indexPath.row]
        if let imageData = data.profilePic{
            if let image = UIImage(data: imageData){
                cell.imageEmployee.image = image
            }
        }
        cell.name.text = data.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "EmployeeInfoVC") as! EmployeeInfoVC
        vc.selectedEmployee = allEmployees[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

