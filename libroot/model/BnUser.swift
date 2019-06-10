//
//  BnUser.swift
//  libroot
//
//  Created by wangzezhi on 2019/6/4.
//  Copyright © 2019 Dazhi528. All rights reserved.
//
import ObjectMapper

// 用户登录接口响应类
public struct BnUser : Mappable, Codable{
    public var intUserId: Int? // 用户id
    public var strUserName: String? // 用户名称
    public var strUserNo: String? // 用户帐号
    public var strUserPass: String? // 用户密码
    public var intSiteId: Int? // 所属站点id
    public var strSiteNo: String? // 所属站点编码(站点id为0时以此为准)
    public var strSiteName: String? // 所属站点名称
    public var strToken: String? // 登录成功后获取的令牌(会话Id)
    public var intType: Int? // 用户类型
    public var strGroup: String? // 所属用户组
    public var strPhone: String? // 手机号码
    public var strAppTitle: String? //应用标题
    // 预留;基本资料检查更新的结果，表与待更新记录数之间用:分隔，多个表用
    public var strDataInfo: String?
    public var strVar1: String? // 备用
    public var strVar2: String? // 备用
    public var strVar3: String? // 备用
    
    
    public init?(map: Map) {
    }
    public mutating func mapping(map: Map) {
        intUserId <- map["userid"]
        strUserName <- map["fullname"]
        strUserNo <- map["userno"]
        strUserPass <- map["pwd"]
        intSiteId <- map["sta_id"]
        strSiteNo <- map["sta_no"]
        strSiteName <- map["sta_name"]
        strToken <- map["token"]
        intType <- map["user_type"]
        strGroup <- map["user_group"]
        strPhone <- map["mobile"]
        strAppTitle <- map["app_title"]
        strDataInfo <- map["datainfo"]
        strVar1 <- map["var_no1"]
        strVar2 <- map["var_no2"]
        strVar3 <- map["var_no3"]
    }
    
    
}
