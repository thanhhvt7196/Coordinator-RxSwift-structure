//
//  String+Extension.swift
//  MVVMCoordinatorStructure
//
//  Created by thanh tien on 9/15/20.
//  Copyright © 2019 kennyS. All rights reserved.
//

import Foundation
import UIKit

extension String {
    var toDate: Date? {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter.date(from: self)
    }

    func nsRange(of searchString: String) -> NSRange? {
        let nsString = self as NSString
        let range = nsString.range(of: searchString)
        return range.location != NSNotFound ? range : nil
    }

    func attributedString(withHighlightedText text: String, color: UIColor = .yellow) -> NSAttributedString {
        guard let range = lowercased().nsRange(of: text.lowercased()) else {
            return NSAttributedString(string: self)
        }

        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(.foregroundColor, value: color, range: range)

        return attributedString
    }

}

extension String {
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}

extension String {
    var isValidPassword: Bool {
        do {
            let regex = try NSRegularExpression(pattern: "^[!-\\[|\\]-~]+$", options: .caseInsensitive)
            return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
        } catch {
            return false
        }
    }
}

extension Optional where Wrapped == String {
    var isNilOrEmpty: Bool {
        return self == nil || self == ""
    }
}
