//
//  UIAlertController+Rx.swift
//  RxSwiftCoordinator
//
//  Created by thanh tien on 9/15/20.
//  Copyright © 2019 kennyS. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UIAlertController {
    var title: Binder<String> {
        return Binder(base) { alertController, title in
            alertController.title = title
        }
    }
    
    var message: Binder<String> {
        return Binder(base) { alertController, message in
            alertController.message = message
        }
    }
}
