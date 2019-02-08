import UIKit

extension UITextField {
    func underlined() {
        let border = CALayer()
        let width = CGFloat(0.2)
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}

extension UIView {
    func setRounded() {
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.masksToBounds = true
//        self.clipsToBounds = true
    }
    
    func setShadow() {
        self.backgroundColor = nil
        self.clipsToBounds = false
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 10
        self.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.frame.width / 2).cgPath
    }
}
