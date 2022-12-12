
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtUsername : UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        /*
         You have to implement here the validation for the fields, returning TRUE if everything is good or
         FALSE if the Segue should not be performed.
         */
        
        if identifier == Segue.toListView {
            
            guard txtUsername.text!.count >= 2 else {
                Toast.ok(view: self, title: "Oops!", message: "Username must be at least 2 characters long.", handler: nil)
                return false
            }
            
            guard txtPassword.text! == "2031317" else {
                Toast.ok(view: self, title: "Oops!", message: "Password must be the correct student number", handler: nil)
                return false
            }
        }
        
        return true
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        /*
         Implement the code to send the user name to ListViewController.
         */
        
        if segue.identifier == Segue.toListView {
            let listView = segue.destination as! ListViewController
            listView.loggedUserName = txtUsername.text!
        }
    }
}

