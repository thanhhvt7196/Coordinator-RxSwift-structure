//
//  MypageViewModel.swift
//  MVVMCoordinatorStructure
//
//  Created by thanh tien on 9/15/20.
//  Copyright © 2020 thanh tien. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class MypageViewModel: ServicesViewModel {
    var services: MypageServices!
   
    func transform(input: Input) -> Output {
        return Output()
    }
}

extension MypageViewModel {
    struct Input {
        
    }
    
    struct Output {
        
    }
}
