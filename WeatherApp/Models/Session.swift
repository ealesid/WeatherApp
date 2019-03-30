import Foundation

private let _userId = 4374588
private let _token = "d14444ebb9939b268b778b331e12331a8d59ca76a010e36fd1b51733d2f86b1b8ebdf2503634854d7db93"

class Session {
    
    var userId: Int?
    var token: String?
    
    static let userSession = Session(userId: _userId, token: _token)
    
    private init(userId: Int, token: String) {
        self.userId = userId
        self.token = token
    }
    
}
