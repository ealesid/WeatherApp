import UIKit

class LoginFormController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var labelAppTitle: UILabel!
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    private let demoUser = "user"
    private let demoPassword = "passwd"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.labelAppTitle.text = "AppName"
        self.loginInput.underlined()
        self.passwordInput.underlined()
    }
    
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
            print("Login successful")
        } else {
            print("Wrong username or password")
        }
    }
    
}
