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
public extension Observable {
    
    //将JSON数据转成对象
    func mapperObject<T>(type: T.Type) -> Observable<T> where T:Mappable {
        return self.map { (element) -> T in
            print(element)
            guard let parsedObject = T(JSONString: element as! String) else {
                throw RxCatch.error(errorInfo: "Failure of parsing")
            }
            return parsedObject
        }
    }
    
    //将JSON数据转成数组
    func mapperArray<T>(type: T.Type) -> Observable<[T]> where T:Mappable {
        return self.map { (element) -> [T] in
            print(element)
            guard let parsedArray = [T](JSONString: element as! String) else {
                throw RxCatch.error(errorInfo: "Failure of parsing")
            }
            return parsedArray
        }
    }
    
    
}
