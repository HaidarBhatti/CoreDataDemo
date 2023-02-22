//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Haidar Bhatti on 21/02/2023.
//

import UIKit

class CreateEmployeeVC: UIViewController {

    @IBOutlet weak var imageEmployee: UIImageView!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageEmployee.isUserInteractionEnabled = true
        imageEmployee.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        print("image tapped")
    }
    
    @IBAction func onTapCreateEmployee(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "allEmployeesVC") as! allEmployeesVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

