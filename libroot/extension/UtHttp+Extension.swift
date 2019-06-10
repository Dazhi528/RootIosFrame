//
//  UtHttp+Extension.swift
//  libroot
//
//  Created by wangzezhi on 2019/6/5.
//  Copyright © 2019 Dazhi528. All rights reserved.
//
import KeychainSwift

extension UtHttp {
    private static let key = "com.dazhi.libroot.udid"
    private static var _udid:String?
    
    public static func getUdid() -> String {
        if let udid = _udid {
            return udid
        }
        let keychain = KeychainSwift()
        if let udid = keychain.get(key) {
            _udid = udid
            return udid
        }
        _udid = UtRoot.getUuidStr()
        keychain.set(_udid!, forKey: key)
        return _udid!
    }
    
}
