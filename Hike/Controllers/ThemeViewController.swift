//
//  ThemeViewController.swift
//  Hike
//
//  Created by Manuel Cubillo on 2/9/19.
//  Copyright © 2019 Manuel Cubillo. All rights reserved.
//

import UIKit

class ThemeViewController: UIViewController {
    public var themeColors: [CGColor]?
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.addGradientLayer(colors: themeColors!, locations: [0.0, 0.50, 1.0])
    }
}
