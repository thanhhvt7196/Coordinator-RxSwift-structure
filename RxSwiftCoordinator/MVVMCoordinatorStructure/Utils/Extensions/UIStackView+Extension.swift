//
//  UIStackView+Extension.swift
//  MVVMCoordinatorStructure
//
//  Created by thanh tien on 9/15/20.
//  Copyright © 2020 kennyS. All rights reserved.
//

import Foundation
import UIKit

extension UIStackView {
    func removeAllArrangedSubviews() {
        while arrangedSubviews.count > 0 {
            arrangedSubviews.first?.removeFromSuperview()
        }
    }
}
