//
//  StudentListViewController.swift
//  MidtermReview
//
//  Created by english on 2022-10-17.
//

import UIKit


class StudentListViewController: UIViewController {
    
    var loggedUserEmailAddress : String?
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var tableStudent: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    func initialize() {
        lblEmail.text = loggedUserEmailAddress
    }
}
