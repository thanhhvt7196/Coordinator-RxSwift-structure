//
//  SplashViewModel.swift
//  RxSwiftCoordinator
//
//  Created by thanh tien on 9/15/20.
//  Copyright © 2020 thanh tien. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class SplashViewModel: ViewModel {
    func transform(input: Input) -> Output {
        let splashFinish = Observable.just(())
            .delay(DispatchTimeInterval.seconds(3), scheduler: MainScheduler.instance)
            .asDriver(onErrorJustReturn: ())
        return Output(splashFinish: splashFinish)
    }
}

extension SplashViewModel {
    struct Input {
        
    }
    
    struct Output {
        var splashFinish: Driver<Void>
    }
}
