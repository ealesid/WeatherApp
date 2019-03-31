import UIKit

import RealmSwift

class GroupsTableViewController: UITableViewController {
    
    var groups: Results<GroupModel>?
    
    var token: NotificationToken?
    
//    var groups: [GroupModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.reloadGroups()
        
//        GroupsManager.shared.removeAllGroups()
        
//        GroupsManager.shared.getAllGroups { (groups: [GroupModel], error: Error?) in
//            self.groups = groups
//            OperationQueue.main.addOperation { self.tableView.reloadData() }
//        }

        
//        ApiManager.shared.getGroups { (response: GroupsGet?, error: Error?) in
//            guard let groupsList = response?.response.items else { return }
//            print("\n\(#file)\n\t\(#function):\t\(#line)\n\t\(groupsList)")
//            self.groups = groupsList
//            OperationQueue.main.addOperation { self.tableView.reloadData() }
//        }


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    // MARK: - Reload
    
    func reloadGroups() {
        var realm: Realm?
        do {
            realm = try Realm()
        } catch {
            print("\n\(#file)\n\t\(#function):\t\(#line)\n\tRealm exception")
        }
        
        self.groups = realm?.objects(GroupModel.self)
        self.token = self.groups?.observe({ (changes: RealmCollectionChange) in
            switch changes {
            case .initial(_):
                self.tableView.reloadData()
            case .update(let groups, let deletions, let insertions, let modifications):
                    self.tableView.beginUpdates()
                    self.tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }), with: .middle)
                    self.tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0) }), with: .middle)
                    self.tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0) }), with: .middle)
                    self.tableView.endUpdates()
            case .error(let error):
                print("\n\(#file)\n\t\(#function):\t\(#line)\n\tGroupsTable update error:\n\t\(error)")
            }
        })
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.groups?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupTableViewCell", for: indexPath) as! GroupTableViewCell
        cell.setGroup(self.groups![indexPath.row])
        return cell
    }

    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            self.groups.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//            tableView.reloadData()
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
//    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        // Проверка перехода (на экран добавления группы)
        if segue.identifier == "addGroup", let dvc = segue.destination as? AddGroupTableViewController {
        // Оповещаем экран добавления группы что мы умеем добавлять группы (устанавливаем себя делегатом)
            dvc.delegate = self
        }
    }

}


//extension GroupsTableViewController: AddGroupDelegate {
//    func addGroup(_ group: GroupModel) {
//        self.groups.append(group)
//        self.tableView.reloadData()
//    }
//}


extension GroupsTableViewController: AddGroupDelegate {
    func addGroup(_ group: GroupModel) {
        do {
            let realm = try Realm()
            realm.beginWrite()
            realm.add(group)
            try realm.commitWrite()
        } catch {
            print("\n\(#file)\n\t\(#function):\t\(#line)\n\tAdd group error:\n\t\(error)")
        }
    }
}
