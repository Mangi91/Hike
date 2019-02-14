//
//  HikeViewController.swift
//  Hike
//
//  Created by Manuel Cubillo on 2/9/19.
//  Copyright © 2019 Manuel Cubillo. All rights reserved.
//

import UIKit

class HikeViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!

    public var themeImageNames:[String] = ["","","3dglasses","bat","bowtie","lips","feather","heartglasses","crown","mask","pica","sombrero","",""] //empty elements so that you can scroll to the end of the carousel theme options
    
    override var prefersStatusBarHidden: Bool { return true }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView.scrollToItem(at: IndexPath(row:4, section: 0), at: .centeredHorizontally, animated: false)
    }
                
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToThemePageVC" {
            let vc = segue.destination as! ThemePageViewController
            vc.themePageVCDelegate = self
        }
    }
}
