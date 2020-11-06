//
//  SceneCoordinator.swift
//  MVVMCoordinatorStructure
//
//  Created by thanh tien on 9/15/20.
//  Copyright © 2019 kennyS. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

class SceneCoordinator: NSObject, SceneCoordinatorType {
    static var shared: SceneCoordinator!
    
    fileprivate var window: UIWindow
    fileprivate var currentViewController: UIViewController {
        didSet {
            currentViewController.navigationController?.delegate = self
            currentViewController.tabBarController?.delegate = self
        }
    }
    
    required init(window: UIWindow) {
        self.window = window
        currentViewController = window.rootViewController!
    }
    
    func setCurrentViewController(viewController: UIViewController) {
        currentViewController = SceneCoordinator.actualViewController(for: viewController)
    }
    
    static func actualViewController(for viewController: UIViewController) -> UIViewController {
        var controller = viewController
        if let tabBarController = controller as? UITabBarController {
            guard let selectedViewController = tabBarController.selectedViewController else {
                return tabBarController
            }
            controller = selectedViewController
            return actualViewController(for: controller)
        }
        
        if let navigationController = viewController as? UINavigationController {
            controller = navigationController.viewControllers.first!
            return actualViewController(for: controller)
        }
        return controller
    }
    
    @discardableResult
    func transition(to scene: TargetScene) -> Observable<Void> {
        let subject = PublishSubject<Void>()
        
        switch scene.transition {
        case let .tabBar(tabBarController):
            guard let selectedViewController = tabBarController.selectedViewController else {
                fatalError("Selected view controller doesn't exists")
            }
            currentViewController = SceneCoordinator.actualViewController(for: selectedViewController)
            window.rootViewController = tabBarController
        case let .root(viewController):
            currentViewController = SceneCoordinator.actualViewController(for: viewController)
//            window.rootViewController = viewController
            window.switchRootViewController(to: viewController)
            subject.onCompleted()
        case let .push(viewController):
            guard let navigationController = currentViewController.navigationController else {
                fatalError("Can't push a view controller without a current navigation controller")
            }
            
            _ = navigationController.rx.delegate
                .sentMessage(#selector(UINavigationControllerDelegate.navigationController(_:didShow:animated:)))
                .map { _ in }
                .bind(to: subject)
            navigationController.pushViewController(SceneCoordinator.actualViewController(for: viewController), animated: true)
        case let .present(viewController):
            viewController.presentationController?.delegate = currentViewController
            currentViewController.present(viewController, animated: true) {
                subject.onCompleted()
            }
            currentViewController = SceneCoordinator.actualViewController(for: viewController)
        }
        
        return subject
            .asObservable()
            .take(1)
    }
    
    func pop(animated: Bool, toRoot: Bool) {
        if let presentingViewController = currentViewController.presentingViewController {
            currentViewController.dismiss(animated: animated) {
                self.currentViewController = SceneCoordinator.actualViewController(for: presentingViewController)
            }
        } else if let navigationController = currentViewController.navigationController {
            if toRoot {
                navigationController.popToRootViewController(animated: animated)
                currentViewController = SceneCoordinator.actualViewController(for: navigationController.viewControllers.first!)
            } else {
                guard navigationController.popViewController(animated: animated) != nil else {
                    fatalError("can't navigate back from \(currentViewController)")
                }
                currentViewController = SceneCoordinator.actualViewController(for: navigationController.viewControllers.last!)
            }
        } else {
            fatalError("Not a modal, no navigation controller: can't navigate back from \(currentViewController)")
        }
    }
}

// MARK: - UINavigationControllerDelegate

extension SceneCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        currentViewController = SceneCoordinator.actualViewController(for: viewController)
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        switch operation {
        case .push:
            if toVC is FadeAnimatedViewController {
                return FadePushAnimator(type: .navigation)
            }
            return nil
        case .pop:
            if fromVC is FadeAnimatedViewController {
                return FadePopAnimator(type: .navigation)
            } else {
                return nil
            }
        default:
            return nil
        }
    }
}

// MARK: - UITabBarControllerDelegate

extension SceneCoordinator: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController)  {
        currentViewController = SceneCoordinator.actualViewController(for: viewController)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
    
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TabBarFadedAnimationTransitioning()
    }
}
