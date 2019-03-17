import UIKit

class FriendsTableViewCell: UITableViewCell {
        
    @IBOutlet weak var friendNameLabel: UILabel!
    @IBOutlet weak var friendPhotoView: UIImageView!
    
    func setFriend(_ friend: FriendModel) {
        self.friendNameLabel.text = friend.name
        self.friendPhotoView.image = friend.image
        self.friendPhotoView.setRounded()
    }
    
}
