import Foundation
import Firebase


class FireBaseGroupModel {
    let name: String
    let id: Int
    let ref: DatabaseReference?
    
    init(name: String, id: Int) {
        self.ref = nil
        self.name = name
        self.id = id
    }
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: Any],
            let name = value["name"] as? String,
            let id = value["id"] as? Int
        else { return nil }
        
        self.ref = snapshot.ref
        self.name = name
        self.id = id
    }
    
    func toAnyObject() -> [String: Any] {
        return [
            "id": id,
            "name": name,
        ]
    }
}
