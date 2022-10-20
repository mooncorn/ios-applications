//
//  ViewController.swift
//  MidtermReview
//
//  Created by english on 2022-10-17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == Segue.toStudentListViewController {
            
            guard let email = txtEmail.text, let password = txtPassword.text else {
                return false
            }
            
            if email.isEmpty || password.isEmpty {
                return false
            }
            
            return true
            
        } else {
            return false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segue.toStudentListViewController {
            let studentListViewController = segue.destination as! StudentListViewController
            
            studentListViewController.loggedUserEmailAddress = txtEmail.text
        }
    }
}

