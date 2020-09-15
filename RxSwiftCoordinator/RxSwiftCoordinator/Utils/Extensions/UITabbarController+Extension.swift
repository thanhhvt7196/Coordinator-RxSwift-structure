//
//  UITabbarController+Extension.swift
//  RxSwiftCoordinator
//
//  Created by thanh tien on 9/15/20.
//  Copyright © 2020 kennyS. All rights reserved.
//

import Foundation
import UIKit

extension UITabBarController {
    func checkCurrentViewController<T: UIViewController>(type: T.Type) -> T? {
        if let selectedViewController = selectedViewController as? UINavigationController, let visibleViewController = selectedViewController.visibleViewController as? T {
            return visibleViewController
        } else {
            return nil
        }
    }
}
