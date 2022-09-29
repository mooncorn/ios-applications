//
//  ViewController.swift
//  MultipleObjectsSameAction
//
//  Created by english on 2022-09-29.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var swOptionA : UISwitch!
    @IBOutlet weak var swOptionB : UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func swOptionsValueChanged(_ sender: UISwitch) {
        switch sender.tag {
        case 1:
            if swOptionA.isOn {
                swOptionB.isOn = false
            }
        case 2:
            if swOptionB.isOn {
                swOptionA.isOn = false
            }
        default:
            break
        }
    }
    
    @IBAction func btnPogTouchUpInside(_ sender: Any) {
        Toast.ok(view: self, title: "Warning", message: "Deleting file system", handler: nil)
    }
}

