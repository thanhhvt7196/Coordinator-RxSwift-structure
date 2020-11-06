//
//  InputValidates.swift
//  MVVMCoordinatorStructure
//
//  Created by thanh tien on 9/15/20.
//  Copyright © 2020 thanh tien. All rights reserved.
//

import Foundation

enum InputValidateType {
    case password
    case username
}

class InputValidate {
    static let shared = InputValidate()

    func validate(type: InputValidateType, text: String) -> String {
        let textTrimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
        var err = ""
        switch type {
        case .password:
            err = validatePassword(text: textTrimmed)
        case .username:
            err = validateUsername(text: textTrimmed)
        }
        return err
    }
    
    func validate(type: InputValidateType, text: String) -> Bool {
        let textTrimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
        switch type {
        case .password:
            return validatePassword(text: textTrimmed)
        case .username:
            return validateUsername(text: textTrimmed)
        }
    }
    
    private func validatePassword(text: String) -> String {
        if text.count <= 0 {
            return Strings.passwordIsEmpty
        } else if !text.isValidPassword {
            return Strings.passwordIsInvalid
        } else if text.count < Constants.passwordMinLength || text.count > Constants.passwordMaxlength {
            return String(format: Strings.passwordInRange, Constants.passwordMinLength, Constants.passwordMaxlength)
        }
        return ""
    }
    
    private func validatePassword(text: String) -> Bool {
        if text.count <= 0 {
            return false
        } else if !text.isValidPassword {
            return false
        }
        return true
    }
    
    private func validateUsername(text: String) -> String {
        if text.isEmpty {
            return Strings.usernameIsEmpty
        }
        return ""
    }
    
    private func validateUsername(text: String) -> Bool {
        let error: String = validateUsername(text: text)
        return error.isEmpty
    }
}
