//
//  ChatCell.swift
//  MarvelChat
//
//  Created by Elizabeth Rudenko on 25/07/2019.
//  Copyright © 2019 Elizabeth Rudenko. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {
    @IBOutlet weak var sentLabel: UILabel!
    @IBOutlet weak var recievedLabel: UILabel!
    @IBOutlet weak var sentView: CustomizableView!
    @IBOutlet weak var recievedView: CustomizableView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        recievedLabel.text = nil
        recievedView.isHidden = true
        sentLabel.text = nil
        sentView.isHidden = true
    }
    
    func setupLabel(with text: String?, for type: MessageType) {
        switch type {
        case .received:
            recievedLabel.text = text
            self.recievedView.isHidden = false
        case .sent:
            sentLabel.text = text
            self.sentView.isHidden = false
        }
    }
}
