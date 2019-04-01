import UIKit
import FirebaseDatabase


protocol AddGroupDelegate: class {
    func addGroup(_ group: GroupModel)
}


class AddGroupTableViewController: UITableViewController {
    
    // объект, который умеет добавлять группы
    weak var delegate: AddGroupDelegate?
    
//    private var groups: [Group] = [
//        Group(name: "1st Group", image: UIImage(named: "firstGroup")!),
//        Group(name: "2nd Group", image: UIImage(named: "secondGroup")!),
//        Group(name: "3rd Group", image: UIImage(named: "thirdGroup")!),
//        Group(name: "4th Group", image: UIImage(named: "groupNoPhoto")!),
//        ]
    
    private var groups: [GroupModel] = []
    
    var filteredGroups: [GroupModel] = []
    
    private var newGroups: [FireBaseGroupModel] = []
    private let ref = Database.database().reference(withPath: "groups")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ApiManager.shared.getGroups { (response: GroupsGet?, error: Error?) in
            guard let groupsList = response?.response.items else { return }
            self.groups = groupsList
            self.filteredGroups = groupsList
            OperationQueue.main.addOperation { self.tableView.reloadData() }
        }

        
//        let groupsTableVC = self.delegate as! GroupsTableViewController
//        self.filteredGroups = self.groups.filter { !groupsTableVC.groups!.contains($0) }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredGroups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewGroupTableViewCell", for: indexPath) as! NewGroupTableViewCell
        cell.setGroup(self.filteredGroups[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.addGroup(self.filteredGroups[indexPath.row])
        self.filteredGroups.remove(at: indexPath.row)
        self.tableView.reloadData()
    }
    
}


//  Так как на текущем экране мы не знаем как добавить город, просто поручаем это делегату
extension AddGroupTableViewController {
//    func addGroup(_ group: GroupModel) {
//        self.delegate?.addGroup(group)
//    }

    func addGroup(_ group: GroupModel) {
        let alertVC = UIAlertController(title: "Add new group", message: nil, preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            let newGroup = FireBaseGroupModel(name: group.name, id: group.id)
            let groupRef = self.ref.child(group.name.lowercased())
            groupRef.setValue(newGroup.toAnyObject())
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertVC.addTextField { groupName in groupName.text = group.name }
        
        alertVC.addAction(saveAction)
        alertVC.addAction(cancelAction)
        
        present(alertVC, animated: true, completion: nil)
    }

    func filter(query: String) {
        self.filteredGroups.removeAll()
        
        var isInFilter = true
        
        for group in self.groups {
            if query.count > 0 {
                isInFilter = (group.name.lowercased().contains(query.lowercased()))
            }
            
            if isInFilter {
                self.filteredGroups.append(group)
            }
        }
        
        self.tableView.reloadData()
    }
}

extension AddGroupTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filter(query: searchText)
    }
    
}
