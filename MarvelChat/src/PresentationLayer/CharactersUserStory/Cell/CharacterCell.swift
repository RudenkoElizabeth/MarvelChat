//
//  CharacterCell.swift
//  MarvelChat
//
//  Created by Elizabeth Rudenko on 25/07/2019.
//  Copyright © 2019 Elizabeth Rudenko. All rights reserved.
//

import UIKit
import Kingfisher

class CharacterCell: UITableViewCell {
    
    // MARK: - Value
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var initialLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        initialLabel.text = nil
        initialLabel.isHidden = true
        characterImageView.image = nil
    }
    
    // MARK: - Setup
    
    func setupNameLabelWith(text: String?) {
        nameLabel.text = text
    }
    
    func setupInitialLabelWith(text: String?) {
        initialLabel.isHidden = false
        initialLabel.text = text?.getUpperCase()
    }
    
    func setupCharacterImageViewWith(imageUrlString: String) {
        let url = URL(string: imageUrlString)
        characterImageView.kf
            .setImage(with: url,     
                      options: [.transition(.fade(0.3))]
        )
    }
}
