import UIKit


protocol AddGroupDelegate: class {
    func addGroup(_ group: Group)
}


class AddGroupTableViewController: UITableViewController {
    
    // объект, который умеет добавлять группы
    weak var delegate: AddGroupDelegate?
    
    var groups: [Group] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstGroup = Group(name: "1st Group", image: UIImage(named: "firstGroup")!)
        let secondGroup = Group(name: "2nd Group", image: UIImage(named: "secondGroup")!)
        let thirdGroup = Group(name: "3rd Group", image: UIImage(named: "thirdGroup")!)
        let forthGroup = Group(name: "4th Group", image: UIImage(named: "groupNoPhoto")!)
        
        self.groups.append(firstGroup)
        self.groups.append(secondGroup)
        self.groups.append(thirdGroup)
        self.groups.append(forthGroup)
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.groups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewGroupTableViewCell", for: indexPath) as! NewGroupTableViewCell
        cell.setGroup(self.groups[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.addGroup(self.groups[indexPath.row])
        self.groups.remove(at: indexPath.row)
        self.tableView.reloadData()
    }
    
}


//  Так как на текущем экране мы не знаем как добавить город, просто поручаем это делегату
extension AddGroupTableViewController {
    func addGroup(_ group: Group) {
        self.delegate?.addGroup(group)
    }
}
