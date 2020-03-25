//
//  ThemeCollectionView.swift
//  Hike
//
//  Created by Manuel Cubillo on 3/24/20.
//  Copyright © 2020 Manuel Cubillo. All rights reserved.
//

import UIKit

class ThemeCollectionView: UICollectionView {
    private var themeCollectionViewCenterY: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupConstraints()
    }
        
    private func setupConstraints() {
        let device = UIDevice.current.device
        var topConstraintConstant: CGFloat = 0
        
        for constraint in (self.superview?.constraints)! {
            if let id = constraint.identifier {
                if id == "themeCollectionViewCenterY" {
                    themeCollectionViewCenterY = constraint
                }
            }
        }
        
        if device == .iPhone5SSE {
            print("iPhone5SSE")
            topConstraintConstant = 240
        } else if device == .iPhone66S78 {
            print("iPhone66S78")
            topConstraintConstant = 140
        } else if device == .iPhone6P6SP7P8P {
            print("iPhone6P6SP7P8P")
            topConstraintConstant = 180
        } else if device == .iPhoneXXS {
            print("iPhoneXXS")
            topConstraintConstant = 220
        } else if device == .iPhoneXR {
            print("iPhoneXR")
            topConstraintConstant = 240
        } else if device == .iPhoneXSMax {
            print("iPhoneXSMax")
            topConstraintConstant = 250
        }
        
        themeCollectionViewCenterY.constant = topConstraintConstant
    }
}
