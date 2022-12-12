
import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var loggedUserName : String = ""
    
    // this is the context you will use on all methods related to CoreData provider
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var selectedRow : Int = 0
    
    @IBOutlet weak var lblLoggedUserName : UILabel!

    @IBOutlet weak var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblLoggedUserName.text = loggedUserName

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Celebrity.all(context: self.context).count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let celebrity = Celebrity.all(context: self.context)[indexPath.row]
        
        cell.textLabel!.text = celebrity.artisticName
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.selectedRow = indexPath.row
        
        performSegue(withIdentifier: Segue.toInfoViewEditing, sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        /*
         Here you have to send the selected object to InfoViewController.
         
         You can get this object by using the self.selectedRow assigned by tabeView didSelectRowAt function.
         
         Remember to prepare the InfoViewController to receive this object.
         */

        if segue.identifier == Segue.toInfoViewEditing {
            let infoView = segue.destination as! InfoViewController
            infoView.selectedRow = selectedRow
        }
        
    }

    
    @IBAction func btnRefreshTouchUp(_ sender : Any?) {
        
        tableView.reloadData()
        
    }
    
    
}
