//
//  ChatTableViewCell.swift
//  Hike
//
//  Created by Manuel Cubillo on 2/24/19.
//  Copyright © 2019 Manuel Cubillo. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {
    @IBOutlet private weak var chatFriendImageView: UIImageView!
    @IBOutlet private weak var chatFriendNameLabel: UILabel!
    @IBOutlet private weak var chatLatestMessageLabel: UILabel!
    @IBOutlet private weak var chatTimeLabel: UILabel!
    @IBOutlet private weak var chatStatusImageView: UIImageView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //make circle
        chatFriendImageView.layer.borderWidth = 1
        chatFriendImageView.layer.masksToBounds = false
        chatFriendImageView.layer.borderColor = UIColor.clear.cgColor
        chatFriendImageView.layer.cornerRadius = chatFriendImageView.frame.height/2
        chatFriendImageView.clipsToBounds = true
    }
    
    public func setup(chat: Chat) {
        chatFriendImageView.image = UIImage(named: chat.userAvatar)
        chatFriendNameLabel.text = chat.userName
        chatLatestMessageLabel.text = chat.message
        chatTimeLabel.text = chat.time
        chatStatusImageView.image = UIImage(named: chat.timeIcon)
    }
}
