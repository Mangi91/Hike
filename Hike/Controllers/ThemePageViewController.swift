//
//  ThemePageViewController.swift
//  Hike
//
//  Created by Manuel Cubillo on 2/8/19.
//  Copyright © 2019 Manuel Cubillo. All rights reserved.
//

import UIKit

protocol ThemePageViewControllerDelegate {
    func transitioningToViewController(atIndex: Int)
}

class ThemePageViewController: UIPageViewController {
    public var themeViewControllers:[UIViewController] = []
    public var themePageVCDelegate: ThemePageViewControllerDelegate?
    public var currentIndex = 2
    public var nextIndex = 2
    
    override var prefersStatusBarHidden: Bool { return true }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        self.delegate = self
        
        setupThemes()
        
        self.setViewControllers([themeViewControllers[2]], direction: .forward, animated: true, completion: nil)
    }
    
    private func setupThemes() {
        let vc1 = createThemeViewController(withColors: [
            UIColor(red: 172/255, green: 100/255, blue: 255/255, alpha: 1.0).cgColor,
            UIColor(red: 130/255, green: 120/255, blue: 255/255, alpha: 1.0).cgColor,
            UIColor(red: 91/255, green: 138/255, blue: 255/255, alpha: 1.0).cgColor
        ])
        vc1.restorationIdentifier = "0"
        themeViewControllers.append(vc1)
        
        let vc2 = createThemeViewController(withColors: [
            UIColor(red: 0/255, green: 94/255, blue: 255/255, alpha: 1.0).cgColor,
            UIColor(red: 10/255, green: 128/255, blue: 255/255, alpha: 1.0).cgColor,
            UIColor(red: 11/255, green: 157/255, blue: 255/255, alpha: 1.0).cgColor
        ])
        vc2.restorationIdentifier = "1"
        themeViewControllers.append(vc2)
        
        let vc3 = createThemeViewController(withColors: [
            UIColor(red: 255/255, green: 74/255, blue: 141/255, alpha: 1.0).cgColor,
            UIColor(red: 238/255, green: 39/255, blue: 119/255, alpha: 1.0).cgColor,
            UIColor(red: 247/255, green: 58/255, blue: 131/255, alpha: 1.0).cgColor
        ])
        vc3.restorationIdentifier = "2"
        themeViewControllers.append(vc3)
        
        let vc4 = createThemeViewController(withColors: [
            UIColor(red: 220/255, green: 8/255, blue: 96/255, alpha: 1.0).cgColor,
            UIColor(red: 255/255, green: 74/255, blue: 141/255, alpha: 1.0).cgColor,
            UIColor(red: 169/255, green: 2/255, blue: 107/255, alpha: 1.0).cgColor
        ])
        vc4.restorationIdentifier = "3"
        themeViewControllers.append(vc4)
        
        let vc5 = createThemeViewController(withColors: [
            UIColor(red: 120/255, green: 8/255, blue: 96/255, alpha: 1.0).cgColor,
            UIColor(red: 355/255, green: 74/255, blue: 141/255, alpha: 1.0).cgColor,
            UIColor(red: 169/255, green: 2/255, blue: 107/255, alpha: 1.0).cgColor
        ])
        vc5.restorationIdentifier = "4"
        themeViewControllers.append(vc5)
        
        let vc6 = createThemeViewController(withColors: [
            UIColor(red: 172/255, green: 100/255, blue: 255/255, alpha: 1.0).cgColor,
            UIColor(red: 130/255, green: 120/255, blue: 255/255, alpha: 1.0).cgColor,
            UIColor(red: 91/255, green: 138/255, blue: 255/255, alpha: 1.0).cgColor
            ])
        vc6.restorationIdentifier = "5"
        themeViewControllers.append(vc6)
        
        let vc7 = createThemeViewController(withColors: [
            UIColor(red: 0/255, green: 94/255, blue: 255/255, alpha: 1.0).cgColor,
            UIColor(red: 10/255, green: 128/255, blue: 255/255, alpha: 1.0).cgColor,
            UIColor(red: 11/255, green: 157/255, blue: 255/255, alpha: 1.0).cgColor
            ])
        vc7.restorationIdentifier = "6"
        themeViewControllers.append(vc7)
        
        let vc8 = createThemeViewController(withColors: [
            UIColor(red: 255/255, green: 74/255, blue: 141/255, alpha: 1.0).cgColor,
            UIColor(red: 238/255, green: 39/255, blue: 119/255, alpha: 1.0).cgColor,
            UIColor(red: 247/255, green: 58/255, blue: 131/255, alpha: 1.0).cgColor
            ])
        vc8.restorationIdentifier = "7"
        themeViewControllers.append(vc8)
        
        let vc9 = createThemeViewController(withColors: [
            UIColor(red: 220/255, green: 8/255, blue: 96/255, alpha: 1.0).cgColor,
            UIColor(red: 255/255, green: 74/255, blue: 141/255, alpha: 1.0).cgColor,
            UIColor(red: 169/255, green: 2/255, blue: 107/255, alpha: 1.0).cgColor
            ])
        vc9.restorationIdentifier = "8"
        themeViewControllers.append(vc9)
        
        let vc10 = createThemeViewController(withColors: [
            UIColor(red: 120/255, green: 8/255, blue: 96/255, alpha: 1.0).cgColor,
            UIColor(red: 355/255, green: 74/255, blue: 141/255, alpha: 1.0).cgColor,
            UIColor(red: 169/255, green: 2/255, blue: 107/255, alpha: 1.0).cgColor
            ])
        vc10.restorationIdentifier = "9"
        themeViewControllers.append(vc10)
        
        let vc11 = createThemeViewController(withColors: [
            UIColor(red: 0/255, green: 94/255, blue: 255/255, alpha: 1.0).cgColor,
            UIColor(red: 10/255, green: 128/255, blue: 255/255, alpha: 1.0).cgColor,
            UIColor(red: 11/255, green: 157/255, blue: 255/255, alpha: 1.0).cgColor
            ])
        vc11.restorationIdentifier = "10"
        themeViewControllers.append(vc11)
        
    }
    
    private func createThemeViewController(withColors colors: [CGColor]) -> UIViewController {
        let storyboard = UIStoryboard.init(name:"Main", bundle: nil)
        
        let tempThemeVC = storyboard.instantiateViewController(withIdentifier:"ThemeVC") as! ThemeViewController
        tempThemeVC.themeColors = colors
        
        return tempThemeVC
    }
}
