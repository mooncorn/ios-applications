
import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var btnDelete: UIButton!
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    var selectedRow: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if selectedRow == nil {
            btnDelete.isHidden = true
            title = "Adding"
        } else {
            title = "Editing"
            let celebrity = CoreDataProvider.all(context: self.context, entityName: "Celebrity")[selectedRow!] as! Celebrity
            
            txtName.text = celebrity.artisticName
            txtEmail.text = celebrity.email
        }
    }
    
    @IBAction func btnSaveTouchUpInside(_ sender: UIBarButtonItem) {
        
        guard let name = txtName.text, !name.isEmpty else {
            return
        }
        
        let celebrity: Celebrity?
        
        if selectedRow == nil { // adding
            celebrity = Celebrity(context: self.context)
            
            celebrity!.uuid = UUID()
            
        } else { // editing
            celebrity = CoreDataProvider.all(context: self.context, entityName: "Celebrity")[selectedRow!] as? Celebrity
        }
        
        celebrity!.artisticName = txtName.text
        celebrity!.email = txtEmail.text
        
        do {
            try CoreDataProvider.save(context: self.context)
            
            navigationController?.popViewController(animated: true)
        } catch {
            print("Error saving celebrity : \(error.localizedDescription)")
        }
    }
    
    @IBAction func btnDeleteTouchUpInside(_ sender: Any) {
        if selectedRow == nil {
            return
        }
        
        do {
            try CoreDataProvider.delete(context: self.context, objectToDelete: (CoreDataProvider.all(context: self.context, entityName: "Celebrity")[selectedRow!] as! Celebrity))
            
            navigationController?.popViewController(animated: true)
            
        } catch {
            print("Error deleting celebrity: \(error.localizedDescription)")
        }
    }
    
}
