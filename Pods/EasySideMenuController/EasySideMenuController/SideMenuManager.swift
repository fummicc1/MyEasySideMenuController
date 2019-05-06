//
//  SideMenuManager.swift
//  EasySideMenuController
//
//  Created by Fumiya Tanaka on 2019/01/18.
//  Copyright © 2019 Fumiya Tanaka. All rights reserved.
//

import Foundation

protocol ShowSideMenuAPI {
    var menuModel: SideMenuModel? { get }
    func showSideMenu(direction: SideMenuModel.Direction,presenting: EasySideMenuController, presented: UIViewController, sideMenuSize: CGSize)
}

public class SideMenuManager: ShowSideMenuAPI {
    
    public static let shared = SideMenuManager()
    private init() { }
    
    var menuModel: SideMenuModel?
    
    public func showSideMenu(direction: SideMenuModel.Direction,presenting: EasySideMenuController, presented: UIViewController, sideMenuSize: CGSize) {
        menuModel = SideMenuModel(direction: direction, size: sideMenuSize)
        presented.modalPresentationStyle = .custom
        presented.transitioningDelegate = presenting
        presenting.present(presented, animated: true, completion: nil)
    }
}
