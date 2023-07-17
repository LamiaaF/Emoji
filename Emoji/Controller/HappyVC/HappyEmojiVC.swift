import UIKit

class HappyEmojiVC: UIViewController {

    var selectedEmoji: EmojiType?
    weak var favoriteButtonDelegate: FavoriteButtonDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addToFavoritesButtonTapped(_ sender: UIButton) {
        // Handle the "Add to Favorites" button action in the target view controller
        if let emoji = selectedEmoji {
            favoriteButtonDelegate?.didTapAddToFavorites(for: emoji)
        }
    }
}
