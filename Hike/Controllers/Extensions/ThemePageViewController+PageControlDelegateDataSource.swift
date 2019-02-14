//
//  ThemePageViewController+PageControlDelegateDataSource.swift
//  Hike
//
//  Created by Manuel Cubillo on 2/10/19.
//  Copyright © 2019 Manuel Cubillo. All rights reserved.
//

import UIKit

extension ThemePageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return themeViewControllers.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = themeViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = vcIndex - 1
        
        if previousIndex < 0 {
            return nil
        }
        
        let previousVC = themeViewControllers[previousIndex]
        
        return previousVC
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = themeViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = vcIndex + 1
        
        if nextIndex >= themeViewControllers.count - 1 {
            return nil
        }
        
        let nextVC = themeViewControllers[nextIndex]
        
        return nextVC
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        let previousVC = pendingViewControllers.first as! ThemeViewController
        if let id = previousVC.restorationIdentifier {
            let index = Int(id)! + 2 //increment by two because of the empty carousel theme options
            
            if nextIndex < index {
                nextIndex += 1
            } else {
                nextIndex -= 1
            }
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            currentIndex = nextIndex
            themePageVCDelegate?.transitioningToViewController(atIndex: currentIndex)
        } else {
            nextIndex = currentIndex
        }
    }
}
