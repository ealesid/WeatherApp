import Foundation


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


class GroupsGetResponse: Codable {
    var count: Int = 0
    var items: [GroupModel] = []
    
    enum CodingKeys: String, CodingKey {
        case count, items
    }
    
    init() {}
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        items = try container.decode([GroupModel].self, forKey: .items)
    }

}


class GroupsGet: Codable {
    var response: GroupsGetResponse = GroupsGetResponse()
    
    enum CodingKeys: String, CodingKey {
        case response
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        response = try container.decode(GroupsGetResponse.self, forKey: .response)
    }

}


class Parser {
    
    static func parseFriendsGet(data: Data?) -> FriendsGet? {
        guard let data = data else { return nil }
        
        do {
            let decoder = JSONDecoder()
            let response: FriendsGet = try decoder.decode(FriendsGet.self, from: data)
            return response
        } catch {
            print("JSONDecoder exception \(#file) \(#function) \(#line) \(error)")
        }
        
        return nil
    }

    static func parseGroupsGet(data: Data?) -> GroupsGet? {
        guard let data = data else { return nil }

        do {
            let decoder = JSONDecoder()
            let response: GroupsGet = try decoder.decode(GroupsGet.self, from: data)
            return response
        } catch {
            print("JSONDecoder exception \(#file) \(#function) \(#line) \(error)")
        }
        
        return nil
    }
}

