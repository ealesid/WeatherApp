import Foundation

private let _userId = 4374588
private let _token = "2ce5490b244a3f06c674fbaf1c1c69e3e9823687583d068e0bf10498d931e27f6fb4a536ddc28343a2500"

class Session {
    
    var userId: Int?
    var token: String?
    
    static let userSession = Session(userId: _userId, token: _token)
    
    private init(userId: Int, token: String) {
        self.userId = userId
        self.token = token
    }
    
}
