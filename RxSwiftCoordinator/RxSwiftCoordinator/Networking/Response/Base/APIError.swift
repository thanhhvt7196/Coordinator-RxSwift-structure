//
//  APIError.swift
//  RxSwiftCoordinator
//
//  Created by thanh tien on 9/15/20.
//  Copyright © 2020 thanh tien. All rights reserved.
//

import Foundation

struct APIError: Error, Codable {
    var success: Bool?
    var status_code: Int?
    var status_message: String?
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        return NSLocalizedString(status_message ?? ErrorMessage.errorOccur, comment: "")
    }
}
