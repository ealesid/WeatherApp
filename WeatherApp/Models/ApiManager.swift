import Foundation

protocol ApiProtocol: class {
    func login(login: String, password: String, completion: @escaping (Error?) -> ())
    
    func getFriends(completion: @escaping (FriendsGet?, Error?) -> ())
    
}

public class ApiManager {
    private init() {}
    static let shared: ApiProtocol = URLSessionManager()
}


private class URLSessionManager: ApiProtocol {

    var urlSession: URLSession?
    
    var showLogs = true
    
    init() {
        let config = URLSessionConfiguration.default
        self.urlSession = URLSession(configuration: config)
    }

    func login(login: String, password: String, completion: @escaping (Error?) -> ()) {
        completion(nil)
    }
    
    func getFriends(completion: @escaping (FriendsGet?, Error?) -> ()) {
        let requestData = RequestData.createRequestForUsersGet()
        self.execute(requestData: requestData) { (data: Data?, error: Error?) in
            completion(Parser.parseFriendsGet(data: data), nil)
        }
    }
    
    // MARK: -
    
    func execute(requestData: RequestData, completion: @escaping (Data?, Error?) -> ()) {
        
        if self.showLogs {
            print("execute \(String(describing: requestData.generateURL()))")
        }
        
        guard let request = requestData.generateRequest() else {
            completion(nil, nil)
            return
        }
        
        let dataTask = self.urlSession?.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) in
            
            if let httpResponse: HTTPURLResponse = response as? HTTPURLResponse {
                let status = httpResponse.statusCode
            }
            
            if self.showLogs {
                print("task finished with errors:\t\(String(describing: error))")
                
                if let responseData = data {
                    let dataString = String(data: responseData, encoding: .utf8)
                    print("dataString:\t\(String(describing: dataString))")
                }
            }
            
            OperationQueue.main.addOperation { completion(data, error) }
            
        })
        
        dataTask?.resume()
    }
    
}
