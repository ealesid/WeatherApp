import UIKit

class NewGroupTableViewCell: UITableViewCell {

    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var groupImageView: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setGroup(_ group: Group) {
        self.groupNameLabel.text = group.name
        self.groupImageView.image = group.image
    }


}
