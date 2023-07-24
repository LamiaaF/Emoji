//
//  GlassesVC.swift
//  Emoji
//
//  Created by 1 on 2023-07-14.
//

import UIKit


protocol EmojiDetailsViewControllerDelegate :AnyObject {
    func didAddFavorite(emojiTypeViewModel: EmojiTypeViewModel)
}

class EmojiDetailsViewController : UIViewController {
    
    @IBOutlet weak var slugLabel: UILabel!
    @IBOutlet weak var subGroupeLabel: UILabel!
    @IBOutlet weak var groupeLabel: UILabel!
    @IBOutlet weak var characterLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
//  var emojiTypeViewModels = [EmojiTypeViewModel]() //
    var emojiTypeViewModels: EmojiTypeViewModel?
    weak var delegate: EmojiDetailsViewControllerDelegate?
    
    var selectedEmojiType: EmojiType? // Variable to hold the selected EmojiType data
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let emojiType = self.emojiTypeViewModels {
                slugLabel.text = emojiType.title
                subGroupeLabel.text = emojiType.groupType
                groupeLabel.text = emojiType.desc
                characterLabel.text = emojiType.emoji
                updateFavoriteButtonLabel()
        }
    
    }
    
    @IBAction func didTapFavoriteButton(_ sender: UIButton) {
                favorite()
                toggleFavorites()
    }
  
    

    func favorite() {
        if let emojiType = selectedEmojiType {
            delegate?.didAddFavorite(emojiTypeViewModel: EmojiTypeViewModel(model: emojiType))
                        
        }
        self.navigationController?.popViewController(animated: true)
    }
    func toggleFavorites() {
             guard var emojiTypeViewModel = self.emojiTypeViewModels else { return }
             emojiTypeViewModel.isFavorite.toggle() // Toggle the favorite status
             self.emojiTypeViewModels = emojiTypeViewModel
             updateFavoriteButtonLabel() // Update the button title based on the new favorite status
             delegate?.didAddFavorite(emojiTypeViewModel: emojiTypeViewModel) // Notify the delegate of the updated favorite status
         }
       func updateFavoriteButtonLabel() {
           guard let emojiTypeViewModel = self.emojiTypeViewModels else { return }
           let buttonTitle = emojiTypeViewModel.isFavorite ? "Remove from Favorite" : "Add to Favorite"
           favoriteButton.setTitle(buttonTitle, for: .normal)
       }
   }


