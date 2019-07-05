//
//  Observable+Extension.swift
//  libroot
//
//  Created by wangzezhi on 2019/6/6.
//  Copyright © 2019 Dazhi528. All rights reserved.
//
import RxSwift
import ObjectMapper

// 数据映射错误
public enum RxCatch: Error {
    case error(errorInfo: String)
}

public extension Error {
    func rawString() -> String {
        guard let err = self as? RxCatch else {
            return self.localizedDescription
        }
        switch err {
         case let .error(errorInfo):
            return errorInfo
        }
    }
}

// 扩展Observable：增加模型映射方法
public extension Observable where Element: Any {
    
    //将JSON数据转成对象
    func mapperObject<T>(type: T.Type) -> Observable<T> where T:Mappable {
        return self.map { (element) -> T in
            UtRoot.log(element)
            guard let parsedObject = T(JSONString: element as! String) else {
                throw RxCatch.error(errorInfo: "Failure of parsing")
            }
            return parsedObject
        }
    }
    
    //将JSON数据转成数组
    func mapperArray<T>(type: T.Type) -> Observable<[T]> where T:Mappable {
        return self.map { (element) -> [T] in
            UtRoot.log(element)
            guard let parsedArray = [T](JSONString: element as! String) else {
                throw RxCatch.error(errorInfo: "Failure of parsing")
            }
            return parsedArray
        }
    }
    
    // 自定义订阅
    func customSubscribe(_ disposeBag: DisposeBag,
        next: ((Element) -> Void)? = nil,
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
