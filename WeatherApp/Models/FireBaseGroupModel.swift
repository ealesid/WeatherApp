import Foundation
import UIKit

import Firebase


class FireBaseGroupModel {
    let id: Int
    let name: String
    let image_url: String?
    let ref: DatabaseReference?
    
    var image: UIImage? {
        guard let url = image_url else { return UIImage(named: "noPhoto") }
        let imageData: Data? = try? Data(contentsOf: URL(string: url)!)
        if let data = imageData { return UIImage(data: data) }
        return UIImage(named: "noPhoto")
    }
    
    init(id: Int, name: String, image_url: String) {
        self.ref = nil
        self.id = id
        self.name = name
        self.image_url = image_url
    }
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: Any],
            let id = value["id"] as? Int,
            let name = value["name"] as? String,
            let image_url = value["image_url"] as? String
        else { return nil }
        
        self.ref = snapshot.ref
        self.id = id
        self.name = name
        self.image_url = image_url
    }
    
    func toAnyObject() -> [String: Any] {
        return [
            "id": id,
            "name": name,
            "image_url": image_url!,
        ]
    }
}
