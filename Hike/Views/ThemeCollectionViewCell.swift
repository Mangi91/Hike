//
//  ThemeCollectionViewCell.swift
//  Hike
//
//  Created by Manuel Cubillo on 2/11/19.
//  Copyright © 2019 Manuel Cubillo. All rights reserved.
//

import UIKit

class ThemeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var themeBackground: UIView!
    @IBOutlet weak var theme: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override var bounds: CGRect {
        didSet {
            self.layoutIfNeeded()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        themeBackground.layer.borderWidth = 1
        themeBackground.layer.masksToBounds = false
        themeBackground.layer.borderColor = UIColor.clear.cgColor
        themeBackground.layer.cornerRadius = themeBackground.frame.width/2
        themeBackground.clipsToBounds = true
    }
}
