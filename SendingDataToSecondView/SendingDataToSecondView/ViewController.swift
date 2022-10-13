//
//  ViewController.swift
//  SendingDataToSecondView
//
//  Created by english on 2022-10-13.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var txtMessage : UITextField!
    
    @IBAction func txtMessageEditingChanged( _ sender : Any ) {
        if let message = txtMessage.text, message.count > 0 {
            txtMessage.backgroundColor = .white
        } else {
            txtMessage.backgroundColor = .yellow
        }
    }
    
    @IBAction func btnTxtMessageTouchUpInside( _ sender : Any ) {
        // Red Button
        guard let message = txtMessage.text, message.count > 0 else {
            return
        }
        
        performSegue(withIdentifier: Segue.toSecondView, sender: nil) // calls prepare
    }
    
    // Triggered by performSegue and called BEFORE the view is presented
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segue.toSecondView || segue.identifier == Segue.toSecondViewByGreenButton {
            let secondviewController = segue.destination as! SecondViewController
            secondviewController.receivedMessage = txtMessage.text
        }
    }
    
    // Intersept a segue
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        // Green Button
        if identifier == Segue.toSecondViewByGreenButton {
            if let message = txtMessage.text, message.count > 0 {
                return true
            }
        }
        
        return false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialize()
    }
    
    func initialize() {
        txtMessage.backgroundColor = .yellow
    }
}

