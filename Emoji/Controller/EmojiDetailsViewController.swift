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
    var emojiTypeViewModels = [EmojiTypeViewModel]() //

    weak var delegate: EmojiDetailsViewControllerDelegate?
    
    var selectedEmojiType: EmojiType? // Variable to hold the selected EmojiType data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Use the selectedEmojiType data to display details in the view
        if let emojiType = self.selectedEmojiType {
            slugLabel.text = emojiType.slug
            subGroupeLabel.text = emojiType.subGroup
            groupeLabel.text = emojiType.group
            characterLabel.text = emojiType.character
        }
    }
    
    @IBAction func favoriteButton(_ sender: UIButton) {
        favorite()
    }
    

    func favorite() {
        if let emojiType = selectedEmojiType {
            delegate?.didAddFavorite(emojiTypeViewModel: EmojiTypeViewModel(model: emojiType))
        }
        self.navigationController?.popViewController(animated: true)
    }
}



