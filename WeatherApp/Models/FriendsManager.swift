import Foundation

import RealmSwift


class FriendsManager {
    
    static let shared = FriendsManager()
    
    private var friends: [FriendModel] = []
    
    private init() {}
    
    func removeAllFriends() {
        do {
            let realm = try Realm()
            let allFriends = realm.objects(GroupModel.self)
            try realm.write { realm.delete(allFriends) }
//            print("\n\(#file)\n\t\(#function)\t\(#line)\tdone!")
        } catch {
            print("\n\(#file)\n\t\(#function)\t\(#line)\n\t\(error)")
        }
    }
    
    private func getAllFriendsFromDB() -> [FriendModel]? {
        let realm = try? Realm()
        if let results = realm?.objects(FriendModel.self), results.count > 0 { return Array(results) }
        return []
    }
    
    private func fetchFriends(completion: @escaping ([FriendModel], Error?) -> ()) {
        ApiManager.shared.getFriends { (response: FriendsGet?, error: Error?) in
            guard let friendsList = response?.response.items else { return }
            completion(friendsList, nil)
            OperationQueue.main.addOperation { completion(friendsList, nil) }
        }
    }
    
    func getAllFriends(completion: @escaping ([FriendModel]?, Error?) -> ()) {
        
        print("\n\(#file)\n\t\(#function):\t\(#line)\n\t\(completion)")
        fetchFriends(completion: completion)

        
//        if let friends = getAllFriendsFromDB(), friends.count > 0 {
//            print("\n\(#file)\n\t\(#function):\t\(#line)\n\t\(friends)")
//        }
//        if let friends = fetchFriends(completion: completion), friends.count > 0 {
//            print("\n\(#file)\n\t\(#function):\t\(#line)\n\t\(friends)")
//        }
    }
}
