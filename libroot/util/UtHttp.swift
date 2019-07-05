//
//  UtHttp.swift
//  libroot
//
//  Created by wangzezhi on 2019/6/4.
//  Copyright © 2019 Dazhi528. All rights reserved.
//

import UIKit
import DefaultsKit
import RxSwift
import Alamofire
import RxAlamofire
import ObjectMapper
import SwiftHash
import DeviceKit

public extension DefaultsKey {
    static let keyBnUser = Key<BnUser>("keyBnUser")
}

public class UtHttp {
    private static let APP_ID  = "XhlApp"
    private static let APP_KEY  = "2@*19TC@o.,iu"
    private static let APP_URL = "http://tmsjk.gdxh.com.cn:8010/api.ashx"
    
    private init() {
    }
    
    //获取md5 32位的中间16位
    public static func md5Mid16(_ str: String) -> String {
        let md5Str = MD5(str) as NSString
        if md5Str.length == 32 {
            return md5Str.substring(with: NSMakeRange(8, 16))
        }
        return ""
    }
    
    // MARK: - 请求构建
    // appid/版本名称 (设备型号;  系统名称:系统版本) 例："XhlApp/1.0(iPhone Xʀ; iOS:12.2)"
    private static func getHttpHead() -> String {
        // 通过系统信息字典获得应用版本
        let infoDictionary = Bundle.main.infoDictionary!
        let appVersion = infoDictionary["CFBundleShortVersionString"] as! String
        // 拼接
        var httpHeadStr: String = APP_ID
        httpHeadStr.append("/")
        httpHeadStr.append(appVersion)
        httpHeadStr.append("(")
        // UIDevice.current.model == iPhone
        httpHeadStr.append(Device.current.name ?? "")
        httpHeadStr.append("; ")
        httpHeadStr.append(UIDevice.current.systemName)
        httpHeadStr.append(":")
        httpHeadStr.append(UIDevice.current.systemVersion)
        httpHeadStr.append(")")
        return httpHeadStr
    }
    
    // 请求体
    private static func getHttpBody(_ strCmd: String, _ any: Mappable) -> [String: Any] {
        let strJsonBody=any.toJSONString() ?? ""
        //
        var bnHttpBodyHead=BnHttpBodyHead()
        bnHttpBodyHead.strAppId=APP_ID
        bnHttpBodyHead.strDeviceNo=getUdid() // 设备号(imei)
        bnHttpBodyHead.strCmd=strCmd // 请求命令
        bnHttpBodyHead.strVersion="1.0" // 请求命令的版本，决定body实体的成员
        bnHttpBodyHead.strToken=getBnUser()?.strToken ?? "" // 登录令牌
        bnHttpBodyHead.intType=0 // 请求参数加密方式
        // 生成签名
        var signStr = APP_ID
        signStr.append(strJsonBody)
        signStr.append(strCmd)
        signStr.append(bnHttpBodyHead.strDeviceNo!)
        signStr.append(String(bnHttpBodyHead.intType ?? 0))
        signStr.append(bnHttpBodyHead.strToken!)
        signStr.append(bnHttpBodyHead.strVersion!)
        signStr.append(APP_KEY)
        // 添加签名
        bnHttpBodyHead.strSign=md5Mid16(signStr).lowercased() // 数字签名MD5
        // 生成bodyhead
        let strJsonHead=bnHttpBodyHead.toJSONString() ?? ""
        // 生成请求参数
        let parameters = [
            "head": strJsonHead,
            "body": strJsonBody
        ]
        return parameters
    }
    
    public static func api(_ strCmd: String, _ any: Mappable, msg: String?=nil) -> Observable<String> {
        UtRoot.loadingShow(msg)
        //
        let headers = ["User-Agent": getHttpHead()]
        return requestString(.post, URL(string: APP_URL)!,
                             parameters: getHttpBody(strCmd, any),
                             encoding: URLEncoding.default,
                             headers: headers)//Observable<(HTTPURLResponse, String)>
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .default))
            .map{$1} //取第二个参数(json字符串)
            .mapperObject(type: BnHttpResponse.self) //解析成BnHttpResponse对象
            .map{
                if($0.intCode != 0) {
                    throw RxCatch.error(errorInfo: "code:\(String($0.intCode!))\n\($0.strMsg ?? "")\t\($0.strSolution ?? "")")
                }
                return $0.strBody ?? ""} //取出body的json字符串
            // .observeOn(MainScheduler.instance)
    }

    
    // MARK: - 存取登录响应类
    public static func putBnUser(_ bnUser: BnUser?) {
        if(bnUser==nil) {
            Defaults.shared.clear(.keyBnUser)
        }else {
            Defaults.shared.set(bnUser!, for: .keyBnUser)
        }
    }
    public static func getBnUser()-> BnUser? {
        if(Defaults.shared.has(.keyBnUser)) {
            return Defaults.shared.get(for: .keyBnUser)
        }else {
            return nil
        }
    }
    
    
}
