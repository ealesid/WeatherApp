import Foundation

private let _userId = 4374588
private let _token = "2c19ba940beec5ddaf6587d94809d97429aa34f1f01c15d2405d1c3eda47571b5e21c56b6fc15d79070bb"

class Session {
    
    var userId: Int?
    var token: String?
    
    static let userSession = Session(userId: _userId, token: _token)
    
    private init(userId: Int, token: String) {
        self.userId = userId
        self.token = token
    }
    
}
