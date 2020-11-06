//
//  Double+Extension.swift
//  MVVMCoordinatorStructure
//
//  Created by thanh tien on 9/15/20.
//  Copyright © 2020 kennyS. All rights reserved.
//

import Foundation

extension Double {
    func removeZerosFromEnd() -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: self)
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 0 //maximum digits in Double after dot (maximum precision)
        return String(formatter.string(from: number) ?? "")
    }
}

extension Optional where Wrapped == Double {
    var isNilOrZero: Bool {
        return self == nil || self == 0
    }
}
