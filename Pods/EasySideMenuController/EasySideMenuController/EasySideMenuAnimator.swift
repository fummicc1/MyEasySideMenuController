//
//  EasySideMenuAnimator.swift
//  EasySideMenuController
//
//  Created by Fumiya Tanaka on 2019/01/22.
//  Copyright © 2019 Fumiya Tanaka. All rights reserved.
//

import Foundation

class EasySideMenuAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    var size: CGSize {
        return SideMenuManager.shared.menuModel!.size
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.2
    }
    
    private var direction: SideMenuModel.Direction
    
    init(direction: SideMenuModel.Direction) {
        self.direction = direction
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        // 遷移元ViewController
        let from = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as! EasySideMenuController
        // 遷移先ViewController
        let to = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
        let containerView = transitionContext.containerView // 全体の元となるView
        containerView.insertSubview(to.view, belowSubview: from.view)
        
        // set animation start position
        if direction == .left {
            to.view.frame = CGRect(origin: CGPoint(x: -size.width, y: 0), size: CGSize(width: size.width, height: size.height))
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
                to.view.frame = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
            }) { (completed) in
                // トランジションが完了したことを通知 (遷移が中断された状態かを通知)
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        } else if direction == .right {
            to.view.frame = CGRect(x: UIScreen.main.bounds.maxX, y: 0, width: size.width, height: size.height)
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
                to.view.frame = CGRect(x: UIScreen.main.bounds.maxX - self.size.width, y: 0, width: self.size.width, height: self.size.height)
            }) { (completed) in
                // トランジションが完了したことを通知 (遷移が中断された状態かを通知)
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        } else if direction == .top {
            to.view.frame = CGRect(x: 0, y: -size.height, width: size.width, height: size.height)
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
                to.view.frame = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
            }) { (completed) in
                // トランジションが完了したことを通知 (遷移が中断された状態かを通知)
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        } else if direction == .bottom {
            to.view.frame = CGRect(x: 0, y: UIScreen.main.bounds.maxY, width: size.width, height: size.height)
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
                to.view.frame = CGRect(x: 0, y: UIScreen.main.bounds.maxY - self.size.height, width: self.size.width, height: self.size.height)
            }) { (completed) in
                // トランジションが完了したことを通知 (遷移が中断された状態かを通知)
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        }
    }
}
