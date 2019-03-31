import Foundation

private let _userId = 4374588
private let _token = "cbcfbb56bf5555fcaff4e0e8a44d7d5bf747f1a61b243af9cd0e956563ac8f97fe09b6aba67ce1dffd07d"

class Session {
    
    var userId: Int?
    var token: String?
    
    static let userSession = Session(userId: _userId, token: _token)
    
    private init(userId: Int, token: String) {
        self.userId = userId
        self.token = token
    }
    
}
