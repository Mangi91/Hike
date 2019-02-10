//
//  HikeViewController.swift
//  Hike
//
//  Created by Manuel Cubillo on 2/9/19.
//  Copyright © 2019 Manuel Cubillo. All rights reserved.
//

import UIKit

class HikeViewController: UIViewController {
    override var prefersStatusBarHidden: Bool { return true }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToThemePageVC" {
            let vc = segue.destination as! ThemePageViewController
            vc.themePageVCDelegate = self
        }
    }
}
