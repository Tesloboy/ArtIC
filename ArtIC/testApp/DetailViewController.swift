import UIKit

class DetailViewController: UIViewController {

        var person: Person!
        
    @IBOutlet var phoneLabel1: UILabel!
    @IBOutlet var emailLabel1: UILabel!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            title = person.contact
            
            if let person = person {
                phoneLabel1.text = "Phone: \(person.phone)"
                emailLabel1.text = "Email: \(person.email)"
            }
        }
        
    }
//        @IBOutlet var phoneLabel1: UILabel!
//@IBOutlet var phoneLabel1: UILabel!

