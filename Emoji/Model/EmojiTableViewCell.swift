import UIKit

class EmojiTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var starButton: UIButton!


    func config(emoji: EmojiType){
        self.title.text = emoji.title
        self.subTitle.text = emoji.subTitle
        self.iconImageView.image = UIImage(named: emoji.imageName)
        self.starButton.tintColor = emoji.isFavorite ? .red  : .blue
    }
    
}
