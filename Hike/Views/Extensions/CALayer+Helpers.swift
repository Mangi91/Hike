//
//  CALayer+Helpers.swift
//  Hike
//
//  Created by Manuel Cubillo on 5/13/20.
//  Copyright © 2020 Manuel Cubillo. All rights reserved.
//

import UIKit

extension CALayer {
    var containsGradienLayer: Bool  {
        get {
            guard let layers = self.sublayers else {
                return false
            }
            
            for layer in layers {
                if let _ = layer as? CAGradientLayer {
                    return true
                }
            }
            
            return false
        }
    }
    
    func removeLayer(atIndex index: Int) {
        guard let _ = self.sublayers else {
            return
        }

        self.sublayers!.remove(at: index)
    }
}
