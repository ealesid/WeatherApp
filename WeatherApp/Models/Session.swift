import Foundation

private let _userId = 4374588
private let _token = "ff93a5f19aeb65058dd3730f4137cc0bb7577fe72afcd63cf724f5033f6494e1cf4faef6511e2e23b93b0"

class Session {
    
    var userId: Int?
    var token: String?
    
    static let userSession = Session(userId: _userId, token: _token)
    
    private init(userId: Int, token: String) {
        self.userId = userId
        self.token = token
    }
    
}
