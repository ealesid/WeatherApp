import Foundation
import UIKit

class Group {
    var name: String?
    var image: UIImage?
    
    init(name: String) {
        self.name = name
    }
    
    init(name: String, image: UIImage = UIImage(named: "noPhoto")!) {
        self.name = name
        self.image = image
    }
}


extension Group: Equatable {
    static func ==(lhs: Group, rhs: Group) -> Bool {
        return lhs.name == rhs.name
    }
}


class GroupModel: Codable {
    var id: Int?
    var name: String = ""
    var photo_50: String?
    var photo_100: String?
    var photo_200: String?
    
    var image: UIImage?
    
    enum CodingKeys: String, CodingKey {
        case id, name, photo_50, photo_100, photo_200
    }
    
    init() {}
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        photo_50 = try container.decode(String.self, forKey: .photo_50)
        photo_100 = try container.decode(String.self, forKey: .photo_100)
        photo_200 = try container.decode(String.self, forKey: .photo_200)
    }
    
    init(name: String, image: UIImage = UIImage(named: "noPhoto")!) {
        self.name = name
        self.image = image
    }
}


extension GroupModel: Equatable {
    static func == (lhs: GroupModel, rhs: GroupModel) -> Bool {
        return lhs.name == rhs.name
    }
}
