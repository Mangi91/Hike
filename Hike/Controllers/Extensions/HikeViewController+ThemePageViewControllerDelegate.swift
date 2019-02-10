//
//  HikeViewController+ThemePageViewControllerDelegate.swift
//  Hike
//
//  Created by Manuel Cubillo on 2/10/19.
//  Copyright © 2019 Manuel Cubillo. All rights reserved.
//

import UIKit

extension HikeViewController: ThemePageViewControllerDelegate {
    func viewControllerBefore(previousVCIndex: Int?) {
        if let _ = previousVCIndex {
            
        }
    }
    
    func viewControllerAfterCalled(nextVCIndex: Int?) {
        if let _ = nextVCIndex {
            
        }
    }
}
