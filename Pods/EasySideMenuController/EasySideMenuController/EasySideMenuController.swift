//
//  EasySideMenuPresentationController.swift
//  EasySideMenuController
//
//  Created by Fumiya Tanaka on 2019/01/18.
//  Copyright © 2019 Fumiya Tanaka. All rights reserved.
//

import Foundation

open class EasySideMenuController: UIViewController, UIViewControllerTransitioningDelegate {
    
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return EasyPresentationController(presented: presented, presenting: presenting)
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return EasySideMenuAnimatorDismiss(direction: SideMenuManager.shared.menuModel!.direction)
    }

    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return EasySideMenuAnimator(direction: SideMenuManager.shared.menuModel!.direction)
    }
    
}
