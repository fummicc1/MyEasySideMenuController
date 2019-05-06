//
//  EasySideMenuAnimatorDismiss.swift
//  EasySideMenuController
//
//  Created by Fumiya Tanaka on 2019/02/05.
//  Copyright © 2019 Fumiya Tanaka. All rights reserved.
//

import UIKit

class EasySideMenuAnimatorDismiss: NSObject, UIViewControllerAnimatedTransitioning {
    
    var size: CGSize {
        return SideMenuManager.shared.menuModel!.size
    }
    private var direction: SideMenuModel.Direction
    
    init(direction: SideMenuModel.Direction) {
        self.direction = direction
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.2
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // 遷移元ViewController
        let from = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
        // set animation start position
        if direction == .left {
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
                from.view.frame = CGRect(x: -self.size.width, y: 0, width: self.size.width, height: self.size.height)
            }) { (completed) in
                // トランジションが完了したことを通知 (遷移が中断された状態かを通知)
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        } else if direction == .right {
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
                from.view.frame = CGRect(x: UIScreen.main.bounds.maxX, y: 0, width: self.size.width, height: self.size.height)
            }) { (completed) in
                // トランジションが完了したことを通知 (遷移が中断された状態かを通知)
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        } else if direction == .top {
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
                from.view.frame = CGRect(x: 0, y: -self.size.height, width: self.size.width, height: self.size.height)
            }) { (completed) in
                // トランジションが完了したことを通知 (遷移が中断された状態かを通知)
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        } else if direction == .bottom {
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
                from.view.frame = CGRect(x: 0, y: UIScreen.main.bounds.maxY, width: self.size.width, height: self.size.height)
            }) { (completed) in
                // トランジションが完了したことを通知 (遷移が中断された状態かを通知)
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        }
    }
}
