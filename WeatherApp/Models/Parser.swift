import Foundation


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


class FriendsGetResponse: Codable {
    var count: Int = 0
    var items: [FriendModel] = []
    
    enum CodingKeys: String, CodingKey {
        case count, items
    }
    
    init() {}
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        items = try container.decode([FriendModel].self, forKey: .items)
    }
}


class FriendsGet: Codable {
    var response: FriendsGetResponse = FriendsGetResponse()
    
    enum CodingKeys: String, CodingKey {
        case response
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        response = try container.decode(FriendsGetResponse.self, forKey: .response)
    }
}


class Parser {
    
    static func parseFriendsGet(data: Data?) -> FriendsGet? {
        guard let data = data else {
            return nil
        }
        
        do {
            let decoder = JSONDecoder()
            let response: FriendsGet = try decoder.decode(FriendsGet.self, from: data)
            return response
        } catch {
            print("JSONDecoder exception \(#file) \(#function) \(#line) \(error)")
        }
        
        return nil
    }
}

