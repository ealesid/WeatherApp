import Foundation
import UIKit


class Friend {
    var name: String?
    var image: UIImage?
    
    init(name: String) {
        self.name = name
    }
    
    init(name: String, image: UIImage) {
        self.name = name
        self.image = image
    }
}
