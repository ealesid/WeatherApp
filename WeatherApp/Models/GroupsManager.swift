import Foundation

import RealmSwift


class GroupsManager {
    
    static let shared = GroupsManager()
    
    private init() {}
    
    func removeAllGroups() {
        do {
            let realm = try Realm()
            let allGroups = realm.objects(GroupModel.self)
            try realm.write { realm.delete(allGroups) }
        } catch {
            print("\n\(#file)\n\t\(#function)\t\(#line)\n\t\(error)")
        }
    }
    
    private func getAllGroupsFromDB() -> [GroupModel]? {
        let realm = try? Realm()
        if let results = realm?.objects(GroupModel.self), results.count > 0 { return Array(results) }
        return []
    }
    
    
    private func fetchGroups(completion: @escaping ([GroupModel], Error?) -> ()) {
        ApiManager.shared.getGroups { (response: GroupsGet?, error: Error?) in
            guard let groupsList = response?.response.items else { return }
            self.saveGroups(groupsList)
            completion(groupsList, nil)
        }
    }
    
    private func saveGroups(_ groupsList: [GroupModel]) {
        do {
            let realm = try Realm()
            realm.beginWrite()
            realm.add(groupsList)
            try realm.commitWrite()
        } catch {
            print("\n\(#file)\n\t\(#function)\t\(#line)\n\t\(error)")
        }
    }
    
    func getAllGroups(completion: @escaping ([GroupModel], Error?) -> ()) {
        if let groups = getAllGroupsFromDB(), groups.count > 0 {
            completion(groups, nil)
        } else {
            fetchGroups(completion: completion)
        }
    }
}
