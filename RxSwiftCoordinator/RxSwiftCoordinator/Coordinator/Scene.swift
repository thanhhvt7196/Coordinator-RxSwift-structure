//
//  Scene.swift
//  RxSwiftCoordinator
//
//  Created by thanh tien on 9/15/20.
//  Copyright © 2019 kennyS. All rights reserved.
//

import UIKit

protocol TargetScene {
    var transition: SceneTransitionType { get }
}

enum Scene {
    case splash
    case tabbar
}

extension Scene: TargetScene {
    var transition: SceneTransitionType {
        switch self {
        case .tabbar:
            let rootTabbarController = RootTabbarController.instantiate()
            
            let homeViewModel = HomeViewModel()
            let homeViewController = HomeViewController.instantiate(withViewModel: homeViewModel)
            let homeNavController = BaseNavigationController(rootViewController: homeViewController)
            let homeTabbarItem = UITabBarItem(title: Strings.home, image: Asset.tabIconHomeNormal.image, selectedImage: Asset.tabIconHomeNormal.image)
            homeNavController.tabBarItem = homeTabbarItem
            
            let searchViewModel = SearchViewModel()
            let searchViewController = SearchViewController.instantiate(withViewModel: searchViewModel)
            let searchNavController = BaseNavigationController(rootViewController: searchViewController)
            let searchTabbarItem = UITabBarItem(title: Strings.search, image: Asset.tabIconSearchNormal.image, selectedImage: Asset.tabIconSearchNormal.image)
            searchNavController.tabBarItem = searchTabbarItem
            
            let mypageViewModel = MypageViewModel()
            let mypageViewController = MypageViewController.instantiate(withViewModel: mypageViewModel)
            let mypageNavController = BaseNavigationController(rootViewController: mypageViewController)
            let moreTabbarItem = UITabBarItem(title: Strings.more, image: Asset.mcflyMoreNormal.image, selectedImage: Asset.mcflyMoreNormal.image)
            mypageNavController.tabBarItem = moreTabbarItem
            
            
            rootTabbarController.viewControllers = [homeNavController, searchNavController, mypageNavController]
            return .tabBar(rootTabbarController)
        case .splash:
            let splashViewModel = SplashViewModel()
            let splashViewController = SplashViewController.instantiate(withViewModel: splashViewModel)
            return .root(splashViewController)
        }
    }
}
