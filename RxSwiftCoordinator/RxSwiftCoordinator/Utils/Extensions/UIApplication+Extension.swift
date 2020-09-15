//
//  UIApplication+Extension.swift
//  RxSwiftCoordinator
//
//  Created by thanh tien on 9/15/20.
//  Copyright © 2020 kennyS. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    @discardableResult
    static func addSubviewToWindowWithoutAnimation(view: UIView) -> Bool {
        if #available(iOS 13.0, *) {
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                let sceneDelegate = windowScene.delegate as? SceneDelegate,
                let window = sceneDelegate.window
            else {
                return false
            }
            window.addSubview(view)
            return true
        } else {
            guard let window = UIApplication.shared.keyWindow else {
                return false
            }
            window.addSubview(view)
            return true
        }
    }
    
    @discardableResult
    static func addSubviewToWindow(view: UIView) -> Bool {
        view.alpha = 0
        view.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        UIView.animate(withDuration: 0.3) {
            view.alpha = 1
            view.transform = .identity
        }
        return addSubviewToWindowWithoutAnimation(view: view)
    }
}

extension UIApplication {
    var currentWindow: UIWindow? {
        return windows.filter { $0.isKeyWindow }.first
    }
    
    class func topViewController(base: UIViewController? = UIApplication.shared.currentWindow?.rootViewController) -> UIViewController? {
        if let navigationController = base as? UINavigationController {
            return topViewController(base: navigationController.visibleViewController)
        }
        if let tabBarController = base as? UITabBarController {
            if let selected = tabBarController.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}
