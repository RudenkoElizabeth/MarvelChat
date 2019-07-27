//
//  ChatAnswerCell.swift
//  MarvelChat
//
//  Created by Elizabeth Rudenko on 27/07/2019.
//  Copyright © 2019 Elizabeth Rudenko. All rights reserved.
//

import UIKit

class ChatAnswerCell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
    }
    
    func setupLabel(with text: String?) {
        label.text = text
    }
}
