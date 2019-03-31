import Foundation
import UIKit

import RealmSwift


class FriendModel: Object, Codable {
    @objc dynamic var id: Int = 0
    @objc dynamic var first_name: String = ""
    @objc dynamic var last_name: String = ""
    @objc dynamic var photo_50: String?
    @objc dynamic var photo_100: String?
    @objc dynamic var photo_200_orig: String?
    
    var name: String { return "\(first_name) \(last_name)" }
    
    var image: UIImage? {
        guard let url = photo_50 else { return UIImage(named: "noPhoto") }
        let imageData: Data? = try? Data(contentsOf: URL(string: url)!)
        if let data = imageData { return UIImage(data: data) }
        return UIImage(named: "noPhoto")
    }
    
    enum CodingKeys: String, CodingKey {
        case id, first_name, last_name, photo_50, photo_100, photo_200_orig
    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        first_name = try container.decode(String.self, forKey: .first_name)
        last_name = try container.decode(String.self, forKey: .last_name)
        photo_50 = try container.decode(String.self, forKey: .photo_50)
        photo_100 = try container.decode(String.self, forKey: .photo_100)
        photo_200_orig = try container.decode(String.self, forKey: .photo_200_orig)
    }
    
    override static func primaryKey() -> String? { return "id" }
    override static func indexedProperties() -> [String] {return ["first_name", "last_name", ] }
}


//class FriendModel: Codable {
//    var id: Int?
//    var first_name: String = ""
//    var last_name: String = ""
//    var photo_50: String?
//    var photo_100: String?
//    var photo_200_orig: String?
//
//    var name: String { return "\(first_name) \(last_name)" }
//
//    var image: UIImage? {
//        guard let url = photo_50 else { return UIImage(named: "noPhoto") }
//        let imageData: Data? = try? Data(contentsOf: URL(string: url)!)
//        if let data = imageData { return UIImage(data: data) }
//        return UIImage(named: "noPhoto")
//    }
//
//    enum CodingKeys: String, CodingKey {
//        case id, first_name, last_name, photo_50, photo_100, photo_200_orig
//    }
//
//    init() {}
//
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        id = try container.decode(Int.self, forKey: .id)
//        first_name = try container.decode(String.self, forKey: .first_name)
//        last_name = try container.decode(String.self, forKey: .last_name)
//        photo_50 = try container.decode(String.self, forKey: .photo_50)
//        photo_100 = try container.decode(String.self, forKey: .photo_100)
//        photo_200_orig = try container.decode(String.self, forKey: .photo_200_orig)
//    }
//}
