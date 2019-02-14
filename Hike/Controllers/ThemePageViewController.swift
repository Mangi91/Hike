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
    public var currentIndex = 4 //carousel current starter index
    public var nextIndex = 4
    
    private var themeColors:[[CGColor]] = [
        UIColor.HikeLightSlateBlueTheme,
        UIColor.HikeDodgerBlueTheme,
        UIColor.HikeBrilliantRoseTheme,
        UIColor.HikeRazzmatazzTheme,
        UIColor.HikeInchWormTheme,
        UIColor.HikeScarletTheme,
        UIColor.HikeGoldTheme,
        UIColor.HikeCrimsonTheme,
        UIColor.HikeGoldenFizzTheme,
        UIColor.HikeMantisTheme,
        UIColor.HikeMantisTheme
    ]
    
    override var prefersStatusBarHidden: Bool { return true }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        self.delegate = self
        
        setupThemes()
        
        self.setViewControllers([themeViewControllers[2]], direction: .forward, animated: true, completion: nil)
    }
    
    private func setupThemes() {
        for i in 0..<11 {
            let theme = createThemeViewController(withColors: themeColors[i])
            theme.restorationIdentifier = "\(i)"
            themeViewControllers.append(theme)
        }
        
    }
    
    private func createThemeViewController(withColors colors: [CGColor]) -> UIViewController {
        let storyboard = UIStoryboard.init(name:"Main", bundle: nil)
        
        let tempThemeVC = storyboard.instantiateViewController(withIdentifier:"ThemeVC") as! ThemeViewController
        tempThemeVC.themeColors = colors
        
        return tempThemeVC
    }
}
