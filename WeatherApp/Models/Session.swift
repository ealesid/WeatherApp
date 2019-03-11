import Foundation

private let _userId = 4374588
private let _token = "f09cdf00867019334f03dc2cbd48f678178d5b794636a56138fc6e3f465f4514aa7f9176f5f554b5963dd"

class Session {
    
    var userId: Int?
    var token: String?
    
    static let userSession = Session(userId: _userId, token: _token)
    
    private init(userId: Int, token: String) {
        self.userId = userId
        self.token = token
    }
    
}
