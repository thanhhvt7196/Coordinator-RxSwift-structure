//
//  CGColor+Extension.swift
//  MVVMCoordinatorStructure
//
//  Created by thanh tien on 9/15/20.
//  Copyright © 2020 thanh tien. All rights reserved.
//

import Foundation
import UIKit

class Colors {
    var gradientLayer = CAGradientLayer()
    
    init() {
        let colorTop = UIColor.black
        let colorBottom = UIColor.white
        self.gradientLayer.colors = [colorTop, colorBottom]
        self.gradientLayer.locations = [0.0, 1.0]
    }
}
