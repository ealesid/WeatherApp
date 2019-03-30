import Foundation

import RealmSwift


class FriendsManager {
    
    static let shared = FriendsManager()
<<<<<<< HEAD
    
=======
        
>>>>>>> c63ca565f22a8d2767a663539f259ec5bae3f5d4
    private init() {}
    
    func removeAllFriends() {
        do {
            let realm = try Realm()
            let allFriends = realm.objects(GroupModel.self)
            try realm.write { realm.delete(allFriends) }
        } catch {
            print("\n\(#file)\n\t\(#function)\t\(#line)\n\t\(error)")
        }
    }
    
    private func getAllFriendsFromDB() -> [FriendModel]? {
        let realm = try? Realm()
        if let results = realm?.objects(FriendModel.self), results.count > 0 { return Array(results) }
        return []
    }
    
<<<<<<< HEAD

    private func fetchFriends(completion: @escaping ([FriendModel], Error?) -> ()) {
        ApiManager.shared.getFriends { (response: FriendsGet?, error: Error?) in
            guard let friendsList = response?.response.items else { return }
            completion(friendsList, nil)
        }
    }
    
    func getAllFriends(completion: @escaping ([FriendModel], Error?) -> ()) {
        if let friends = getAllFriendsFromDB(), friends.count > 0 {
            completion(friends, nil)
        } else {
            fetchFriends(completion: completion)
        }
=======
    private func fetchFriends() -> [FriendModel] {
        
        ApiManager.shared.getFriends { (response: FriendsGet?, error: Error?) in
            guard let friendsList = response?.response.items else { return }
//            print("\n\(#file)\n\t\(#function):\t\(#line)\n\t\(friendsList)")
        }
    }
    
    
    func getAllFriends() -> [FriendModel]? {
        if let friends = getAllFriendsFromDB(), friends.count > 0 { return friends }
        if let friends = fetchFriends(), friends.count > 0 { return friends }

        return []
>>>>>>> c63ca565f22a8d2767a663539f259ec5bae3f5d4
    }
}
