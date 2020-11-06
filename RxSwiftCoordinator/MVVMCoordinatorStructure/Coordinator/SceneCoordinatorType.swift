//
//  SceneCoordinatorType.swift
//  MVVMCoordinatorStructure
//
//  Created by thanh tien on 9/15/20.
//  Copyright © 2019 kennyS. All rights reserved.
//

import UIKit
import RxSwift

protocol SceneCoordinatorType {
    init(window: UIWindow)
    
    @discardableResult func transition(to scene: TargetScene) -> Observable<Void>
    func pop(animated: Bool, toRoot: Bool)
}
