import UIKit

class EmojiTableViewCell: UITableViewCell {
    
    @IBOutlet weak var starButton: UIButton!
    @IBOutlet weak var slugLabel: UILabel!
    @IBOutlet weak var characterLabel: UILabel!
    @IBOutlet weak var unicodeNameLabel: UILabel!
    @IBOutlet weak var codePointLabel: UILabel!
    @IBOutlet weak var groupLabel: UILabel!
    
    @IBOutlet weak var subGroupLabel: UILabel!
  
    
    func conf(emoji:EmojiTypeViewModel){
        self.slugLabel.text = emoji.title
        self.characterLabel.text = emoji.emoji
        self.unicodeNameLabel.text = emoji.desc
        self.groupLabel.text = emoji.groupType
        self.starButton.tintColor = emoji.isFavorite ? .red : .blue

    }
}
