//
//  ActivityIndicator.swift
//  RxSwiftCoordinator
//
//  Created by thanh tien on 9/15/20.
//  Copyright © 2020 kennyS. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class ActivityIndicator: SharedSequenceConvertibleType {
    typealias Element = Bool
    typealias SharingStrategy = DriverSharingStrategy

    private let _lock = NSRecursiveLock()
    private let _relay = BehaviorRelay<Bool>(value: false)
    private let _loading: SharedSequence<SharingStrategy, Bool>

    init() {
        _loading = _relay.asDriver()
            .distinctUntilChanged()
    }

    fileprivate func trackActivityOfObservable<O: ObservableConvertibleType>(_ source: O) -> Observable<O.Element> {
        return source.asObservable()
            .do(onNext: { _ in
                self.sendStopLoading()
            }, onError: { _ in
                self.sendStopLoading()
            }, onCompleted: {
                self.sendStopLoading()
            }, onSubscribe:
                subscribed
        )
    }

    private func subscribed() {
        _lock.lock()
        _relay.accept(true) 
        _lock.unlock()
    }

    private func sendStopLoading() {
        _lock.lock()
        _relay.accept(false)
        _lock.unlock()
    }

    func asSharedSequence() -> SharedSequence<SharingStrategy, Element> {
        return _loading
    }
}

extension ObservableConvertibleType {
    func trackActivity(_ activityIndicator: ActivityIndicator) -> Observable<Element> {
        return activityIndicator.trackActivityOfObservable(self)
    }
}
