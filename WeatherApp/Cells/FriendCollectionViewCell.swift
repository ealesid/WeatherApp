import UIKit

class FriendCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var friendNameLabel: UILabel!
    @IBOutlet weak var friendPhotoView: UIImageView!

    func setFriend(_ friend: Friend) {
        self.friendNameLabel.text = friend.name
        self.friendPhotoView.image = friend.image
        self.friendPhotoView.setRounded()
    }
    
}
