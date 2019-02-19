//
//  HikeViewController.swift
//  Hike
//
//  Created by Manuel Cubillo on 2/9/19.
//  Copyright © 2019 Manuel Cubillo. All rights reserved.
//

import UIKit

class HikeViewController: UIViewController {
    @IBOutlet weak var carouselThemeCollectionView: UICollectionView!
    @IBOutlet weak var themeContainer: UIView!
    @IBOutlet weak var chat: ChatTableView!

    public var themeImageNames:[String] = ["","","3dglasses","bat","bowtie","lips","feather","heartglasses","crown","mask","pica","sombrero","",""] //empty elements so you can scroll to end of carousel options
    override var prefersStatusBarHidden: Bool { return true }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        carouselThemeCollectionView.scrollToItem(at: IndexPath(row:4, section: 0), at: .centeredHorizontally, animated: false)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(HikeViewController.themeBackgroundTapped))
        themeContainer.addGestureRecognizer(tapGesture)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToThemePageVC" {
            let vc = segue.destination as! ThemePageViewController
            vc.themePageVCDelegate = self
        }
    }
    
    @objc func themeBackgroundTapped() {
        if chat.isMinimized {
            chat.maximize()
        } else {
            chat.minimize()
        }
    }
}
