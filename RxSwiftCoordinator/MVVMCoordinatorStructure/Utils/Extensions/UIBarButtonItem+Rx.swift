//
//  UIBarButtonItem+Rx.swift
//  MVVMCoordinatorStructure
//
//  Created by thanh tien on 9/15/20.
//  Copyright © 2019 kennyS. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UIBarButtonItem {
    var image: Binder<UIImage> {
        return Binder(base) { button, image in
            button.image = image
        }
    }
}
