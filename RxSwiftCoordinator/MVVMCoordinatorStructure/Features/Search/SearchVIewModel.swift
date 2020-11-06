//
//  SearchVIewModel.swift
//  MVVMCoordinatorStructure
//
//  Created by thanh tien on 9/15/20.
//  Copyright © 2020 thanh tien. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class SearchViewModel: ServicesViewModel {
    var services: SearchServices!
    
    func transform(input: Input) -> Output {
        return Output()
    }
}

extension SearchViewModel {
    struct Input {
        
    }
    
    struct Output {
        
    }
}
