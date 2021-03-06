import UIKit

extension UITextField {
    func underlined() {
        
        let underlined = "underlined"
        
        if !(self.layer.sublayers?.contains { $0.name == underlined })! {
            let border = CALayer()
            border.name = underlined
            let width = CGFloat(0.2)
            border.borderColor = UIColor.lightGray.cgColor
            border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: self.frame.size.height)
            border.borderWidth = width
            self.layer.addSublayer(border)
            self.layer.masksToBounds = true
        }
    }
}

extension UIView {
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get { return layer.shadowRadius }
        set { layer.shadowRadius = newValue }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get { return layer.shadowOpacity }
        set { layer.shadowOpacity = newValue }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get { return layer.shadowOffset }
        set { layer.shadowOffset = newValue }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }


    func setRounded() {
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.masksToBounds = true
//        self.clipsToBounds = true
    }
    
    func setShadow() {
        self.backgroundColor = nil
        self.clipsToBounds = false
        
//        Commented beacuse of shadow have to be set up from Interface Builder
//        self.layer.shadowColor = UIColor.darkGray.cgColor
//        self.layer.shadowOpacity = 0.5
//        self.layer.shadowOffset = CGSize.zero
//        self.layer.shadowRadius = 5
        
        self.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: frame.width / 2).cgPath
    }
}
