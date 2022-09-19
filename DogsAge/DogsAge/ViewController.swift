//
//  ViewController.swift
//  DogsAge
//
//  Created by english on 2022-09-12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var lblDogAge: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func calculateDogsAge(_ age: Int) -> Int {
        return age * 7
    }

    @IBAction func txtAgeEditingChanged(_ sender: Any) {
        lblDogAge.isHidden = true
    }
    
    @IBAction func btnCheckInOutTouchUpInside(_ sender: Any) {
        
        if let age = Int(txtAge.text!) {
            if (age >= 1 && age <= 20) {
                let ageHuman = calculateDogsAge(age)
                lblDogAge.text = "Your dog's age in human age is \(ageHuman)"
                lblDogAge.isHidden = false
            } else {
                Toast.ok(view: self, title: "Oops!", message: "Please, enter a valid age between 1 and 20 years!", handler: nil)
            }
        } else {
            Toast.ok(view: self, title: "Oops!", message: "Please, enter a valid number!", handler: nil)
        }
        
    }
}

