import UIKit

class FriendsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var friendNameLabel: UILabel!
    @IBOutlet weak var friendPhotoImage: UIImageView!
    
    func setFriend(_ friend: Friend) {
        self.friendNameLabel.text = friend.name
        if friend.image != nil {
            self.friendPhotoImage.image = friend.image
        } else {
            self.friendPhotoImage.image = UIImage(named: "noPhoto")
        }
    }
    

}
