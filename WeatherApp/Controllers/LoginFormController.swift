import UIKit

class LoginFormController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var labelAppTitle: UILabel!
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.loginInput.underlined()
        self.passwordInput.underlined()
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
    }
    
}
