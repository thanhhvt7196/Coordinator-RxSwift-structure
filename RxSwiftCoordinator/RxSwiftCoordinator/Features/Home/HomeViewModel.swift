//
//  HomeViewModel.swift
//  RxSwiftCoordinator
//
//  Created by thanh tien on 9/15/20.
//  Copyright © 2020 thanh tien. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewModel: ServicesViewModel {
    var services: HomeServices!
    
    func transform(input: Input) -> Output {
        return Output()
    }
}

extension HomeViewModel {
    struct Input {
        
    }
    
    struct Output {
        
    }
}
