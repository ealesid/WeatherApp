import Foundation
import UIKit

class Group {
    var name: String?
    var image: UIImage?
    
    init(name: String) {
        self.name = name
    }
    
    init(name: String, image: UIImage = UIImage(named: "noPhoto")!) {
        self.name = name
        self.image = image
    }
}
