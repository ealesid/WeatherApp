import Foundation

class RequestData {
    
    let scheme = "https"
    let host = "api.vk.com"
    var path = "/method/"
    var getParams: [String:String] = [:]
    
    var method: String = "GET"
    
    var body: Data?
    
    var timeout: TimeInterval?
    
    func generateURL() -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = self.scheme
        urlComponents.host = self.host
        urlComponents.path = self.path
        
        var urlQueryItems: [URLQueryItem] = []
        for getParmKey in self.getParams.keys {
            let item = URLQueryItem(name: getParmKey, value: self.getParams[getParmKey])
            urlQueryItems.append(item)
        }
        urlComponents.queryItems = urlQueryItems
        
        return urlComponents.url
    }
    
    func generateRequest() -> URLRequest? {
        guard let url = self.generateURL() else {
            return nil
        }
        
        var request = URLRequest(
            url: url,
            cachePolicy: .reloadIgnoringCacheData,
            timeoutInterval: self.timeout ?? 15
        )
        
        request.setValue("iOS", forHTTPHeaderField: "User-Info")
        request.httpMethod = self.method
        request.httpBody = self.body
        
        return request
    }
}

extension RequestData {
    
    static func createRequestForUsersGet() -> RequestData {
        let requestData = RequestData()
        
        requestData.path += "friends.get"
        requestData.timeout = 60
        
        var getParams: [String:String] = [:]
        getParams["v"] = "5.92"
        getParams["access_token"] = Session.userSession.token
        getParams["fields"] = "photo_50,photo_100,photo_200_orig"
        requestData.getParams = getParams
        
        return requestData
    }

    static func createRequestForGroupsGet() -> RequestData {
        let requestData = RequestData()
        
        requestData.path += "groups.get"
        requestData.timeout = 60
        
        var getParams: [String:String] = [:]
        getParams["v"] = "5.92"
        getParams["access_token"] = Session.userSession.token
        getParams["extended"] = "1"
        requestData.getParams = getParams
        
        return requestData
    }
}
