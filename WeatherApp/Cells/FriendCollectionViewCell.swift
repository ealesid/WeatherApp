import UIKit

class FriendCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var friendNameLabel: UILabel!
    @IBOutlet weak var friendPhotoView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    func setFriend(_ friend: FriendModel) {
        
        var image: UIImage? {
            guard let url = friend.photo_200_orig else { return UIImage(named: "noPhoto") }
            let imageData: Data? = try? Data(contentsOf: URL(string: url)!)
            if let data = imageData { return UIImage(data: data) }
            return UIImage(named: "noPhoto")
        }
        
        imageView.image = image
        imageView.setRounded()
        
        self.friendPhotoView.setShadow()
        self.friendPhotoView.addSubview(imageView)
        
        self.friendNameLabel.text = friend.name
    }
}
