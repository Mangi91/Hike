//
//  ChatTableView.swift
//  Hike
//
//  Created by Manuel Cubillo on 2/16/19.
//  Copyright © 2019 Manuel Cubillo. All rights reserved.
//

import UIKit

class ChatTableView: UITableView {
    @IBOutlet weak var chatTableTopCorners: UIView!
    
    private var chatTableTrailing: NSLayoutConstraint!
    private var chatTableLeading: NSLayoutConstraint!
    private var chatTableTop: NSLayoutConstraint!
    private var defaultTopConstraintConstant: CGFloat = 70
    
    public var isMinimized: Bool {
        get {
            return !(chatTableTop.constant == defaultTopConstraintConstant)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupTopRoundedCorners()
        setupConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute:{
            self.setupTopRoundedCorners()
        })
    }
    
    public func minimize() {
        hide(hide: true)
    }
    
    public func maximize() {
        hide(hide: false)
    }
    
    private func hide(hide: Bool) {
        let device = UIDevice.current.device
        var topConstraintConstant: CGFloat = 540 //any default value, just incase
        
        chatTableLeading.constant = hide ? 20 : 0
        chatTableTrailing.constant = hide ? -20 : 0

        if device == .iPhone5SSE {
            topConstraintConstant = 440
        } else if device == .iPhone66S78 {
            topConstraintConstant = 540
        } else if device == .iPhone6P6SP7P8P {
            topConstraintConstant = 620
        } else if device == .iPhoneXXS {
            topConstraintConstant = 640
        } else if device == .iPhoneXR {
            topConstraintConstant = 720
        } else if device == .iPhoneXSMax {
            topConstraintConstant = 730
        }
        
        chatTableTop.constant = hide ? topConstraintConstant : defaultTopConstraintConstant
        
        UIView.animate(withDuration: 0.23 , animations: {
            self.superview!.layoutIfNeeded()
        }, completion: { _ in
            let notif: Notification.Name = hide ? .ChatTableDidMinimize : .ChatTableDidMaximize
            NotificationCenter.default.post(name: notif, object: nil)
        })
    }
    
    private func setupConstraints() {
        let device = UIDevice.current.device
        
        for constraint in (self.superview?.constraints)! {
            if let id = constraint.identifier {
                if id == "ChatTop" {
                    chatTableTop = constraint
                } else if id == "ChatLeading" {
                    chatTableLeading = constraint
                } else if id == "ChatTrailing" {
                    chatTableTrailing = constraint
                }
            }
        }
        
        if device == .iPhoneXXS || device == .iPhoneXR || device == .iPhoneXSMax {
            defaultTopConstraintConstant = 60
            chatTableTop.constant = 60
        }
    }
    
    private func setupTopRoundedCorners() {
        let roundedCornersLayer = CAShapeLayer()
        roundedCornersLayer.path = UIBezierPath(roundedRect: self.chatTableTopCorners.bounds, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 10, height: 10)).cgPath
        self.chatTableTopCorners.layer.mask = roundedCornersLayer
    }
}
