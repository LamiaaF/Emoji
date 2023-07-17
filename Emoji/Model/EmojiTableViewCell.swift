import UIKit

protocol EmojiTableViewCellDelegate: AnyObject {
    func didTapNextButton(in cell: EmojiTableViewCell)
}

protocol FavoriteButtonDelegate: AnyObject {
    func didTapAddToFavorites(for emoji: EmojiType)
}

class EmojiTableViewCell: UITableViewCell {

    weak var delegate: EmojiTableViewCellDelegate?
    weak var favoriteButtonDelegate: FavoriteButtonDelegate?
    var emoji: EmojiType? // This property should not be optional

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var starButton: UIButton!

    @IBAction func nextButtonTapped(_ sender: UIButton) {
        delegate?.didTapNextButton(in: self)
    }

    @IBAction func addToFavoritesButtonTapped(_ sender: UIButton) {
        if let emoji = emoji { // Unwrap the optional emoji
            favoriteButtonDelegate?.didTapAddToFavorites(for: emoji)
        }
    }
}
