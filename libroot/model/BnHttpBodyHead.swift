//
//  BnHttpHead.swift
//  libroot
//
//  Created by wangzezhi on 2019/6/5.
//  Copyright © 2019 Dazhi528. All rights reserved.
//

import ObjectMapper

// Http请求体里的头构建类
struct BnHttpBodyHead : Mappable {
    var strAppId: String? // App设备识别码,固定的，后台规定字段
    var strDeviceNo: String? // 设备号(imei)
    var strCmd: String? // 请求命令(例如：login)
    var strVersion: String? // 请求命令的版本，决定body实体的成员
    var strToken: String? // 登录令牌
    var strSign: String? // 数字签名MD5
    var intType: Int? // 请求参数加密方式
    
    init() {
    }
    init?(map: Map) {
    }
    mutating func mapping(map: Map) {
        strAppId <- map["appid"]
        strDeviceNo <- map["device_id"]
        strCmd <- map["command"]
        strVersion <- map["version"]
        strToken <- map["token"]
        strSign <- map["sign"]
        intType <- map["encrypt_type"]
    }
    
    
}
