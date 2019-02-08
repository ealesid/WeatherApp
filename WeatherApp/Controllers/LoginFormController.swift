import UIKit


class LoginFormController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var labelAppTitle: UILabel!
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    private let demoUser = "123"
    private let demoPassword = "456"
    
    // MARK: - Init
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.addNotifications()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addNotifications()
    }
    
    deinit {
        self.removeNotifications()
    }
    
    // MARK: - Notifications
    
    private func addNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWasShown(notification:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide(notification:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    private func removeNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWasShown(notification: Notification) {
        guard let userInfo = notification.userInfo as NSDictionary? else {
            return
        }
        guard let keyboardFrame = userInfo.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue else {
            return
        }
        
        let keyboardHeight = keyboardFrame.cgRectValue.size.height
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardHeight, right: 0.0)
        
        self.scrollView?.contentInset = contentInsets
        self.scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc private func keyboardWillHide(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        self.scrollView?.contentInset = contentInsets
        self.scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.labelAppTitle.text = "AppName"
        
        self.loginInput?.text = self.demoUser
        self.passwordInput?.text = self.demoPassword
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        self.loginInput.underlined()
        self.passwordInput.underlined()
    }
    
    // MARK: - Actions
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        guard let user = self.loginInput?.text else {
            print("Login Input Field error")
            return
        }
        guard let password = self.passwordInput?.text else {
            print("Password Input Filed error")
            return
        }
        
        if user == self.demoUser && password == self.demoPassword {
//            print("Login successful")
            self.performSegue(withIdentifier: "appStart", sender: nil)
        } else {
            print("Wrong username or password")
        }
    }
    
    @IBAction func closeKeyboardAction() {
        print("closeKeybordAction")
        self.view.endEditing(true)
    }
    
    @IBAction func logoutAction(segue: UIStoryboardSegue) {
        
    }
}
