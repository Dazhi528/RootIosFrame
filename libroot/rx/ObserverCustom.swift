//
//  ObserverCustom.swift
//  libroot
//
//  Created by wangzezhi on 2019/6/5.
//  Copyright © 2019 Dazhi528. All rights reserved.
//

import RxSwift
import RxAlamofire
import Foundation

public struct ObserverCustom<T> : ObserverType {
    /// 别名，简写代码
    public typealias E = T
    public typealias EventHandler = (Event<E>) -> Void
    /// 定义观察者为上面定义的匿名事件处理器
    private let observer: EventHandler
    
    /// 构造方法，把匿名事件处理器传递进来
    public init(_ eventHandler: @escaping EventHandler) {
        self.observer = eventHandler
    }
    
    ///
    public init<O : ObserverType>(_ observer: O) where O.E == E {
        self.observer = observer.on
    }
    
    ///
    public func on(_ event: Event<E>) {
        return self.observer(event)
    }
    
    public func asObserver() -> AnyObserver<E> {
        return AnyObserver(eventHandler: self.on)
    }
   
    
    
    /**
     * 重写方法区
     */
    public func onNext(_ element: E) {
         self.on(.next(element))
    }
    public func onCompleted() {
        self.on(.completed)
    }
    public func onError(_ error: Error) {

        //
        self.on(.error(error))
    }
    

}
