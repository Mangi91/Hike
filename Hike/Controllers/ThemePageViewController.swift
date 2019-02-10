//
//  ThemePageViewController.swift
//  Hike
//
//  Created by Manuel Cubillo on 2/8/19.
//  Copyright © 2019 Manuel Cubillo. All rights reserved.
//

import UIKit

protocol ThemePageViewControllerDelegate {
    func viewControllerBefore(previousVCIndex: Int?)
    func viewControllerAfterCalled(nextVCIndex: Int?)
}

class ThemePageViewController: UIPageViewController {
    public var themeViewControllers:[UIViewController] = []
    public var themePageVCDelegate: ThemePageViewControllerDelegate?
    
    override var prefersStatusBarHidden: Bool { return true }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        self.delegate = self
        
        setupThemes()
        
        self.setViewControllers([themeViewControllers.first!], direction: .forward, animated: true, completion: nil)
    }
    
    private func setupThemes() {
        themeViewControllers.append(createThemeViewController(withColors: [
            UIColor(red: 172/255, green: 100/255, blue: 255/255, alpha: 1.0).cgColor,
            UIColor(red: 130/255, green: 120/255, blue: 255/255, alpha: 1.0).cgColor,
            UIColor(red: 91/255, green: 138/255, blue: 255/255, alpha: 1.0).cgColor
        ]))
        
        themeViewControllers.append(createThemeViewController(withColors: [
            UIColor(red: 0/255, green: 94/255, blue: 255/255, alpha: 1.0).cgColor,
            UIColor(red: 10/255, green: 128/255, blue: 255/255, alpha: 1.0).cgColor,
            UIColor(red: 11/255, green: 157/255, blue: 255/255, alpha: 1.0).cgColor
        ]))
        
        themeViewControllers.append(createThemeViewController(withColors: [
            UIColor(red: 255/255, green: 74/255, blue: 141/255, alpha: 1.0).cgColor,
            UIColor(red: 238/255, green: 39/255, blue: 119/255, alpha: 1.0).cgColor,
            UIColor(red: 247/255, green: 58/255, blue: 131/255, alpha: 1.0).cgColor
        ]))
        
        themeViewControllers.append(createThemeViewController(withColors: [
            UIColor(red: 220/255, green: 8/255, blue: 96/255, alpha: 1.0).cgColor,
            UIColor(red: 255/255, green: 74/255, blue: 141/255, alpha: 1.0).cgColor,
            UIColor(red: 169/255, green: 2/255, blue: 107/255, alpha: 1.0).cgColor
        ]))
    }
    
    private func createThemeViewController(withColors colors: [CGColor]) -> UIViewController {
        let storyboard = UIStoryboard.init(name:"Main", bundle: nil)
        
        let tempThemeVC = storyboard.instantiateViewController(withIdentifier:"ThemeVC") as! ThemeViewController
        tempThemeVC.themeColors = colors
        
        return tempThemeVC
    }
}
