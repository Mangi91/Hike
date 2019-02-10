//
//  ThemePageViewController+PageControlDelegateDataSource.swift
//  Hike
//
//  Created by Manuel Cubillo on 2/10/19.
//  Copyright © 2019 Manuel Cubillo. All rights reserved.
//

import UIKit

extension ThemePageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = themeViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = vcIndex - 1
        
        guard previousIndex >= 0 else {
            self.themePageVCDelegate?.viewControllerBefore(previousVCIndex: nil)
            return nil
        }
        
        let previousVC = themeViewControllers[previousIndex]
        
        self.themePageVCDelegate?.viewControllerBefore(previousVCIndex: previousIndex)
        return previousVC
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = themeViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = vcIndex + 1
        
        guard nextIndex <= themeViewControllers.count - 1 else {
            self.themePageVCDelegate?.viewControllerAfterCalled(nextVCIndex: nil)
            return nil
        }
        
        let nextVC = themeViewControllers[nextIndex]
        
        self.themePageVCDelegate?.viewControllerAfterCalled(nextVCIndex: nextIndex)
        return nextVC
    }
}
