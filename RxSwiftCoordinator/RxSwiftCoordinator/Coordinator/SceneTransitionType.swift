//
//  SceneCoordinatorType.swift
//  RxSwiftCoordinator
//
//  Created by thanh tien on 9/15/20.
//  Copyright © 2019 kennyS. All rights reserved.
//
import UIKit

enum SceneTransitionType {
    case root(UIViewController)
    case push(UIViewController)
    case present(UIViewController)
    case tabBar(UITabBarController) 
}
