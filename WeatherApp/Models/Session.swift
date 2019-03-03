import Foundation

private let _userId = 1
private let _token = "userToken"

class Session {
    
    var userId: Int
    var token: String
    
    static let userSession = Session(userId: _userId, token: _token)
    
    private init(userId: Int, token: String) {
        self.userId = userId
        self.token = token
    }
    
}
