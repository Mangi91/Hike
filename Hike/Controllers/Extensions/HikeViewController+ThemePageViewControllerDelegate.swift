//
//  HikeViewController+ThemePageViewControllerDelegate.swift
//  Hike
//
//  Created by Manuel Cubillo on 2/10/19.
//  Copyright © 2019 Manuel Cubillo. All rights reserved.
//

import UIKit

extension HikeViewController: ThemePageViewControllerDelegate {
    func transitioningToViewController(atIndex: Int) {
        carouselThemeCollectionView.scrollToItem(at: IndexPath(row: atIndex, section: 0), at: .centeredHorizontally, animated: true)
    }
}
