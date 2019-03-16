import UIKit
import WebKit

class VKLoginViewController: UIViewController, WKNavigationDelegate {
    
    weak var webView: WKWebView?
    
    var apiManager: ApiProtocol = ApiManager.shared
    
    let client_id = "6895271"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webView = WKWebView()
        self.view.addSubview(webView)
        webView.navigationDelegate = self
        self.webView = webView
        
        self.makeRequest()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.webView?.frame = self.view.bounds
    }
    
    // MARK: -
    func makeRequest() {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: client_id),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.92"),
            URLQueryItem(name: "state", value: "test"),
            URLQueryItem(name: "revoke", value: "1"),
        ]
        
        if let url = urlComponents.url {
            let request = URLRequest(url: url)
            self.webView?.load(request)
            
            // start
        }
    }
    
    // MARK: - WKNavigationDelegate
    
    // Desides whether to allow or cancel a navigation after its response is known
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        print("navigationResponse.response.url \(String(describing: navigationResponse.response.url))")
        
        if let url = navigationResponse.response.url, url.path == "/blank.html" {
            let urlString = url.absoluteString.replacingOccurrences(of: "https://oauth.vk.com/blank.html#", with: "https://oauth.vk.com/blank.html?")
            
            let urlComponents: URLComponents? = URLComponents(string: urlString)
            
            if let items = urlComponents?.queryItems {
                for item: URLQueryItem in items {
                    print("\t\(item.name) = \(String(describing: item.value))")
                    
                    if item.name == "access_token" {
                        print("Token is:\t\(String(describing: item.value))")
                    }
                }
            }
        }
        
        decisionHandler(.allow)

    }
    
    // Called when a web view receives a server redirect
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        print("webView didReceiveServerRedirectForProvisionalNavigation ->\t")
        self.navigationController?.pushViewController(
            UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "AppStartController"),
            animated: true
        )
        self.getFriends()
    }
    
}

extension VKLoginViewController {

    func getFriends() {
        self.apiManager.getFriends { (error: Error?) in }
    }

}
