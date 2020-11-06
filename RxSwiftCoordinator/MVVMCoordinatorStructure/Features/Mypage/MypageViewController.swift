//
//  MypageViewController.swift
//  MVVMCoordinatorStructure
//
//  Created by thanh tien on 9/15/20.
//  Copyright © 2020 thanh tien. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Reusable
import UIKit

class MypageViewController: BaseViewController, StoryboardBased, ViewModelBased {
    var viewModel: MypageViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
