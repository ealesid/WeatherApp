import UIKit

class FriendCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var friendNameLabel: UILabel!
    @IBOutlet weak var friendPhotoView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    func setFriend(_ friend: FriendModel) {
        
        imageView.image = friend.image
        imageView.setRounded()
        
        self.friendPhotoView.setShadow()
        self.friendPhotoView.addSubview(imageView)
        
        self.friendNameLabel.text = friend.name
    }
}
