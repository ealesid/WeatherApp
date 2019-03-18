import Foundation
import UIKit

import RealmSwift
import Realm


//class GroupModel: Codable {
//    var id: Int?
//    var name: String = ""
//    var photo_50: String?
//    var photo_100: String?
//    var photo_200: String?
//
//    var image: UIImage? {
//        guard let url = photo_50 else { return UIImage(named: "noPhoto") }
//        let imageData: Data? = try? Data(contentsOf: URL(string: url)!)
//        if let data = imageData { return UIImage(data: data) }
//        return UIImage(named: "noPhoto")
//    }
//
//    enum CodingKeys: String, CodingKey {
//        case id, name, photo_50, photo_100, photo_200
//    }
//
//    init() {}
//
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        id = try container.decode(Int.self, forKey: .id)
//        name = try container.decode(String.self, forKey: .name)
//        photo_50 = try container.decode(String.self, forKey: .photo_50)
//        photo_100 = try container.decode(String.self, forKey: .photo_100)
//        photo_200 = try container.decode(String.self, forKey: .photo_200)
//    }
//}
//
//
//extension GroupModel: Equatable {
//    static func == (lhs: GroupModel, rhs: GroupModel) -> Bool {
//        return lhs.name == rhs.name
//    }
//}


class GroupModel: Object, Codable {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var photo_50: String?
    @objc dynamic var photo_100: String?
    @objc dynamic var photo_200: String?
    
    @objc dynamic var image: UIImage? {
        guard let url = photo_50 else { return UIImage(named: "noPhoto") }
        let imageData: Data? = try? Data(contentsOf: URL(string: url)!)
        if let data = imageData { return UIImage(data: data) }
        return UIImage(named: "noPhoto")
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name, photo_50, photo_100, photo_200
    }
    
    required init() { super.init() }
    
    required init(from decoder: Decoder) throws {
        super.init()
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        photo_50 = try container.decode(String.self, forKey: .photo_50)
        photo_100 = try container.decode(String.self, forKey: .photo_100)
        photo_200 = try container.decode(String.self, forKey: .photo_200)
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        fatalError("init(realm:schema:) has not been implemented")
    }
    
    required init(value: Any, schema: RLMSchema) {
        fatalError("init(value:schema:) has not been implemented")
    }
}
