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
    
    var imagePicker = UIImagePickerController()
    let employeeManager = EmployeeManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageEmployee.isUserInteractionEnabled = true
        imageEmployee.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func onTapCreateEmployee(_ sender: UIButton) {
        let image = imageEmployee.image?.pngData()
        employeeManager.createEmployee(employee: Employee(name: txtName.text,
                                                          email: txtEmail.text,
                                                          id: UUID(),
                                                          profilePic: image))
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "allEmployeesVC") as! allEmployeesVC
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension CreateEmployeeVC: UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        imageEmployee.image = image
    }
}
