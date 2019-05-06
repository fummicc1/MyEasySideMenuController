//
//  ViewController.swift
//  MyEasySideMenuController
//
//  Created by Fumiya Tanaka on 2019/05/07.
//  Copyright © 2019 Fumiya Tanaka. All rights reserved.
//

import UIKit
import EasySideMenuController

class ViewController: EasySideMenuController  {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let presentedViewController = UIViewController()
        presentedViewController.view.frame = view.bounds
        presentedViewController.view.backgroundColor = .green
        SideMenuManager.shared.showSideMenu(direction: .left, presenting: self, presented: presentedViewController, sideMenuSize: CGSize(width: 200, height: 300))
    }
}
