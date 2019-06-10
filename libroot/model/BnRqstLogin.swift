//
//  BnRqstLogin.swift
//  libroot
//
//  Created by wangzezhi on 2019/6/6.
//  Copyright © 2019 Dazhi528. All rights reserved.
//

import ObjectMapper

// 用户登录接口响应类
public struct BnRqstLogin : Mappable {
    var strUserName: String?
    var strUserPass: String?
    private var noUse: String=""
    
    
    public init(_ strUserName: String, _ strUserPass: String) {
        self.strUserName=strUserName
        self.strUserPass=strUserPass
    }
    public init?(map: Map) {
    }
    public mutating func mapping(map: Map) {
        strUserName <- map["userno"]
        strUserPass <- map["password"]
        noUse <- map["datainfo"]
    }
    
    
}
