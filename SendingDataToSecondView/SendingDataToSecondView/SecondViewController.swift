//
//  SecondViewController.swift
//  SendingDataToSecondView
//
//  Created by english on 2022-10-13.
//

import UIKit

class SecondViewController: UIViewController {
    
    var receivedMessage : String?
    @IBOutlet weak var lblMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblMessage.text = receivedMessage
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
