//
//  ManageStudentViewController.swift
//  MidtermReview
//
//  Created by english on 2022-10-17.
//

import UIKit

class ManageStudentViewController: UIViewController {
    
    var student : Student?
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var btnDelete: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    @IBAction func btnSaveTouchUpInside(_ sender: Any) {
        // validation
        if student != nil { // update
            student!.name = txtName.text!
            student!.email = txtEmail.text!
            
        } else { // insert
            student = Student(name: txtName.text!, email: txtEmail.text!)
        }
        
        StudentProvider.save(student: student!)
        navigationController?.popViewController(animated: true)
    }
    func initialize() {
        if (student != nil) { // edit/delete
            title = "Editing student"
            btnDelete.isHidden = false
            
            txtEmail.text = student!.email
            txtName.text = student!.name
        } else { // add
            title = "New student"
            btnDelete.isHidden = true
            
            
        }
    }
    
    @IBAction func btnDeleteTouchUpInside(_ sender: Any) {
        StudentProvider.delete(student: student!)
        navigationController?.popViewController(animated: true)
    }
}
