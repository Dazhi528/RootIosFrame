//
//  BnHttpResponse.swift
//  libroot
//
//  Created by wangzezhi on 2019/6/6.
//  Copyright © 2019 Dazhi528. All rights reserved.
//
import ObjectMapper

// Http请求体里的头构建类
struct BnHttpResponse : Mappable {
    var intCode: Int? // 结果码
    var strMsg: String? // 失败时的提示信息
    var strSolution: String? // 出错时的解决方案提示信息
    var strSign: String? // 签名
    var intType: Int? // 返回的实体加密方式
    var strBody: String? // json字符串
    
    
    init?(map: Map) {
    }
    mutating func mapping(map: Map) {
        intCode <- map["result_code"]
        strMsg <- map["message"]
        strSolution <- map["solution"]
        strSign <- map["sign"]
        intType <- map["encrypt_type"]
        strBody <- map["body"]
    }
    

}
