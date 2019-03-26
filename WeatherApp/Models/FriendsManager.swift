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
    
    41private func fetchFriends(completion: @escaping ([FriendModel], Error?) -> ()) {
        
        ApiManager.shared.getFriends { (response: FriendsGet?, error: Error?) in
            guard let friendsList = response?.response.items else { return }
            completion(friendsList, nil)
//            print("\n\(#file)\n\t\(#function):\t\(#line)\n\t\(friendsList)")
        }
    }
    
    private func saveFriends(_ friends: [FriendModel], error: Error?) {
        print("\n\(#file)\n\t\(#function):\t\(#line)\n\t\(friends)")
        self.friends = friends

    }
    
    func getAllFriends() -> [FriendModel]? {

        fetchFriends { (friends: [FriendModel], error: Error?) in
            self.saveFriends(friends, error: error)
        }
        
        
        return self.friends
    }
    
//    func getAllFriends(completion: @escaping ([FriendModel]?, Error?) -> ()) {
//        if let friends = getAllFriendsFromDB(), friends.count > 0 {
//            print("\n\(#file)\n\t\(#function):\t\(#line)\n\t\(friends)")
//        }
//        if let friends = fetchFriends(completion: completion), friends.count > 0 {
//            print("\n\(#file)\n\t\(#function):\t\(#line)\n\t\(friends)")
//        }
//    }
}
