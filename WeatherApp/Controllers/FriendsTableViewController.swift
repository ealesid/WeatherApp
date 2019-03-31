import UIKit

import RealmSwift


class FriendsTableViewController: UITableViewController {
    
    var friends: Results<FriendModel>?
    
    var token: NotificationToken?
    
//    var friends: [FriendModel] = []
//    private var selectedFriend: FriendModel?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.reloadFriends()
        
//        try? FileManager.default.removeItem(at: Realm.Configuration.defaultConfiguration.fileURL!)
        
//        FriendsManager.shared.getAllFriends { (friends: [FriendModel], error: Error?) in
//            self.friends = friends
//            OperationQueue.main.addOperation { self.tableView.reloadData() }
//        }
            
//        FriendsManager.shared.removeAllFriends()
        
//        FriendsManager.shared.getAllFriends { (friends: [FriendModel], error: Error?) in
//            self.friends = friends
//            OperationQueue.main.addOperation { self.tableView.reloadData() }
//        }

//        ApiManager.shared.getFriends { (response: FriendsGet?, error: Error?) in
//            guard let friendsList = response?.response.items else { return }
//            print("\n\(#file)\n\t\(#function):\t\(#line)\n\t\(friendsList)")
//            self.friends = friendsList
//
//            OperationQueue.main.addOperation { self.tableView.reloadData() }
//        }
        
    }
    
    
    // MARK: - Reload
    
    func reloadFriends() {
        var realm: Realm?
        do {
            realm = try Realm()
        } catch {
            print("\n\(#file)\n\t\(#function):\t\(#line)\n\tRealm exception")
        }
        
        self.friends = realm?.objects(FriendModel.self)
        self.token = self.friends?.observe({ (changes: RealmCollectionChange) in
            switch changes {
            case .initial(_):
                self.tableView.reloadData()
            case .update(let friends, let deletions, let insertions, let modifications):
                self.tableView.beginUpdates()
                self.tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }), with: .middle)
                self.tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0) }), with: .middle)
                self.tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0) }), with: .middle)
                self.tableView.endUpdates()
            case .error(let error):
                print("\n\(#file)\n\t\(#function):\t\(#line)\n\tFriendsTable update error:\n\t\(error)")
            }
        })
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return self.friends?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsTableViewCell", for: indexPath) as! FriendsTableViewCell

        cell.setFriend(self.friends![indexPath.row])
        
        return cell
    }
    
    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
//        print("prepeare \(String(describing: segue.identifier))")

        if let identifier = segue.identifier, identifier == "showFriendInfo" {
            if let destinationVC = segue.destination  as? FriendCollectionViewController {
                destinationVC.friend = self.friends![self.tableView.indexPathForSelectedRow!.row]
            }
        }


    }

}
