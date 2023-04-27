import UIKit

enum CollectionActions2: String, CaseIterable {
    case actionOne = "Starry night and the astronauts"
    case actionTwo = "Paris Street. Rainy Day"
    case actionThree = "The Basket of Apples"
    case actionFour = "Self Portrait"
    case actionFive = "A Sunday on La Grande Jatte"
    case actionSix = "Woman at Her Toilette"
}



class TestView: UITableViewController {
  
    let collectionActions2 = CollectionActions.allCases
    
    @IBOutlet var testView: UITableView!
    
    let people = DataManager.shared.getPeople()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

        extension TestView {
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let viewController = segue.destination as! DetailViewController
            //передадим значение трека из выделенной ячейки
            // 1) получим индекс выбранной ячейки, сразу же его развернув(для безопасности)
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            viewController.person = people[indexPath.row]
        }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return collectionActions2.count
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
            let person = people[indexPath.row]
            cell.textLabel?.text = person.contact //"\(person.firstName) \(person.lastName)"
            cell.textLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
            cell.imageView?.image = UIImage(systemName: "phone")
            return cell
        }
        
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
    }
    

