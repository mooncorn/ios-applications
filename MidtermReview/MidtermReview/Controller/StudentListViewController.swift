//
//  StudentListViewController.swift
//  MidtermReview
//
//  Created by english on 2022-10-17.
//

import UIKit


class StudentListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var selectedRow : Int?
    var loggedUserEmailAddress : String?
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var tableStudent: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    func initialize() {
        lblEmail.text = loggedUserEmailAddress
        
        StudentProvider.generateMockData()
        
        for student in StudentProvider.all {
            print(student.toString() + "\n")
        }
        
        tableStudent.delegate = self
        tableStudent.dataSource = self
    }
    
    @IBAction func btnRefreshTouchUpInside(_ sender: Any) {
        tableStudent.reloadData()
    }
    
    // count of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StudentProvider.all.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = StudentProvider.all[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        performSegue(withIdentifier: Segue.toStudentInfoViewControllerEditing, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == Segue.toStudentInfoViewControllerEditing) {
            let manageStudentViewController = segue.destination as! ManageStudentViewController
            manageStudentViewController.student = StudentProvider.all[selectedRow!]
        }
    }
}
