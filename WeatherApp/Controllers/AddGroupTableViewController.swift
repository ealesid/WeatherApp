import UIKit


protocol AddGroupDelegate: class {
    func addGroup(_ group: GroupModel)
}


class AddGroupTableViewController: UITableViewController {
    
    // объект, который умеет добавлять группы
    weak var delegate: AddGroupDelegate?
    
    private var groups: [GroupModel] = []
    
    var filteredGroups: [GroupModel] = []
    
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
    func addGroup(_ group: GroupModel) {
        self.delegate?.addGroup(group)
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
