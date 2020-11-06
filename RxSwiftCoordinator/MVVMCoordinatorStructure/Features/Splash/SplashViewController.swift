//
//  SplashViewController.swift
//  MVVMCoordinatorStructure
//
//  Created by thanh tien on 9/15/20.
//  Copyright © 2020 thanh tien. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift
import Reusable

class SplashViewController: BaseViewController, StoryboardBased, ViewModelBased {
    var viewModel: SplashViewModel!
    
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    private func bind() {
        let input = SplashViewModel.Input()
        let output = viewModel.transform(input: input)
        
        output.splashFinish
            .drive(onNext: { _ in
                SceneCoordinator.shared.transition(to: Scene.tabbar)
            })
            .disposed(by: bag)
    }
}
