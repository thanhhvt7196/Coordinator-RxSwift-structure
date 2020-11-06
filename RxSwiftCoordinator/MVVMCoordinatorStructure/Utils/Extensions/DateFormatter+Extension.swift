//
//  DateFormatter+Extension.swift
//  MVVMCoordinatorStructure
//
//  Created by thanh tien on 9/15/20.
//  Copyright © 2020 thanh tien. All rights reserved.
//

import Foundation

extension DateFormatter {
    convenience init(dateFormat: String, localeIdentifier: String = Constants.defaultLocaleIdentifier) {
        self.init()
        self.calendar = Calendar(identifier: .gregorian)
        self.locale = Locale(identifier: localeIdentifier)
        self.dateFormat = dateFormat
    }
}
