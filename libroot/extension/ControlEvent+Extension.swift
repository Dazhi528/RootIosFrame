//
//  ControlEvent+Extension.swift
//  libroot
//
//  Created by wangzezhi on 2019/6/25.
//  Copyright © 2019 Dazhi528. All rights reserved.
//

import RxCocoa
import RxSwift

public extension ControlEvent where E: Any {
    
    // 自定义订阅
    func customSubscribe(_ disposeBag: DisposeBag,
                         next: ((E) -> Void)? = nil,
                         error: ((Error) -> Void)? = nil,
                         completed: (() -> Void)? = nil) {
        return self.subscribe(onNext: next, onError: { (er) in
            // 关闭加载框
            UtRoot.loadingShut()
            // 打印日志，显示错误
            let erStr=er.rawString()
            UtRoot.toastShort(erStr)
            UtRoot.log(erStr)
            // 如果传入报错闭包，则回到
            if let mError = error {
                mError(er)
            }
        }, onCompleted: {
            // 关闭加载框
            UtRoot.loadingShut()
            // 如果传入完成闭包，则回调
            if let mCompleted = completed {
                mCompleted()
            }
        }).disposed(by: disposeBag)
    }
    
}
