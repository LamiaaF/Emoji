import UIKit

class EmojiViewController: UIViewController, EmojiTableViewCellDelegate, FavoriteButtonDelegate {
    
    @IBOutlet weak var table: UITableView!
    
    var data: [EmojiType] = [
        EmojiType(title: "Glasses", subTitle: "smug face with glasses", imageName: "Glasses", isFavorite: false),
        EmojiType(title: "Happy", subTitle: "Happy face", imageName: "Happy", isFavorite: false),
        EmojiType(title: "Thinking", subTitle: "Thinking face", imageName: "Thinking", isFavorite: false),
        EmojiType(title: "Laughing", subTitle: "laughing face", imageName: "Laughing", isFavorite: false),
        EmojiType(title: "Fire", subTitle: "Fire emoji", imageName: "Fire", isFavorite: false),
        EmojiType(title: "Hundred", subTitle: "One hundred", imageName: "Hundred", isFavorite: false),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        table.register(UINib(nibName: "EmojiTableViewCell", bundle: nil), forCellReuseIdentifier: "EmojiTableViewCell")
    }
    
    // MARK: - EmojiTableViewCellDelegate
    func didTapNextButton(in cell: EmojiTableViewCell) {
        guard let indexPath = table.indexPath(for: cell) else { return }
        let selectedEmoji = data[indexPath.row]

        var emojiViewController: UIViewController?

        switch selectedEmoji.title {
        case "Glasses":
            emojiViewController = GlassesEmojiVC()

        case "Thinking":
            emojiViewController = ThinkingEmojiVC()

        case "Happy":
            emojiViewController = HappyEmojiVC()

        default:
            break
        }

        if let targetVC = emojiViewController {
                  // Pass the selected emoji and favoriteButtonDelegate to the target view controller
                  if let happyEmojiVC = targetVC as? HappyEmojiVC {
                      happyEmojiVC.selectedEmoji = selectedEmoji
                      happyEmojiVC.favoriteButtonDelegate = self
                  } else if let thinkingEmojiVC = targetVC as? ThinkingEmojiVC {
                      thinkingEmojiVC.selectedEmoji = selectedEmoji
                      thinkingEmojiVC.favoriteButtonDelegate = self
//                  } else if let glassesEmojiVC = targetVC as? GlassesEmojiVC {
//                      glassesEmojiVC.selectedEmoji = selectedEmoji
//                      glassesEmojiVC.favoriteButtonDelegate = self
                      
                  }

            self.navigationController?.pushViewController(targetVC, animated: true)
        }
    }

    // MARK: - FavoriteButtonDelegate
    func didTapAddToFavorites(for emoji: EmojiType) {
        // Update the model data to mark the emoji as favorite
        if let index = data.firstIndex(where: { $0.title == emoji.title }) {
            data[index].isFavorite.toggle()

            // Reload the table view to update the star button tint color
            if let cell = table.cellForRow(at: IndexPath(row: index, section: 0)) as? EmojiTableViewCell {
                cell.starButton.tintColor = data[index].isFavorite ? UIColor.systemYellow : UIColor.gray
            }
        }
    }
}

extension EmojiViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Emoji"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 1 ? data.count : 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let emojiType = data[indexPath.row]
        let emojiTypeCell = table.dequeueReusableCell(withIdentifier: "EmojiTableViewCell", for: indexPath) as! EmojiTableViewCell
        emojiTypeCell.title.text = emojiType.title
        emojiTypeCell.subTitle.text = emojiType.subTitle
        emojiTypeCell.iconImageView.image = UIImage(named: emojiType.imageName)
        
        emojiTypeCell.delegate = self
        emojiTypeCell.favoriteButtonDelegate = self // Assign the EmojiViewController as the delegate for the FavoriteButtonDelegate
        emojiTypeCell.starButton.tintColor = emojiType.isFavorite ? UIColor.systemYellow : UIColor.gray // Update the star button tint color
        
        return emojiTypeCell
    }
}
