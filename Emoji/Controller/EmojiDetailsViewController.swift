//
//  GlassesVC.swift
//  Emoji
//
//  Created by 1 on 2023-07-14.
//

import UIKit


protocol EmojiDetailsViewControllerDelegate :AnyObject {
    func didAddFavorite(id: IndexPath)
}

class EmojiDetailsViewController : UIViewController {
    
    weak var delegate: EmojiDetailsViewControllerDelegate?
    var indexPath: IndexPath!
    
    @IBAction func favoriteButton(_ sender: UIButton) {
        favorite()
    }
    
    func favorite(){
        delegate?.didAddFavorite(id: indexPath)
        self.navigationController?.popViewController(animated: true)
    }
    
}
