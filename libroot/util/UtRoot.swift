//
//  UtRoot.swift
//  libroot
//
//  Created by wangzezhi on 2019/6/5.
//  Copyright © 2019 Dazhi528. All rights reserved.
//
import UIKit
import SVProgressHUD

public class UtRoot {
    
    public static func getUuidStr() -> String {
        let uuidRef = CFUUIDCreate(kCFAllocatorDefault)
        let strRef = CFUUIDCreateString(kCFAllocatorDefault, uuidRef)
        let uuidString = (strRef! as String).replacingOccurrences(of: "-", with: "")
        return uuidString
    }
    
    /*
     * ========字体========
     */
    public static func defaultFontWithSize(_ size:CGFloat) -> UIFont{
        return UIFont(name: "PingFangSC-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    public static func defaultBoldFontWithSize(_ size:CGFloat) -> UIFont{
        return UIFont(name: "PingFangSC-Medium", size: size) ?? UIFont.boldSystemFont(ofSize:size)
    }
    
    /*
     * ========获得资源文件========
     */
    // 仅用于本地
    static func getLibString(_ name: String) -> String {
        return getString(name, bundle: kBundleRes)
    }
    static func getLibImage(_ name: String) -> UIImage? {
        return getImage(name, bundle: kBundleRes)
    }
    

    public static func getString(_ name: String, bundle: Bundle?=nil) -> String {
        if(bundle==nil){
            return NSLocalizedString(name, comment: "")
        }else {
             return NSLocalizedString(name, bundle: bundle!, comment: "")
        }
    }
    public static func getImage(_ name: String, bundle: Bundle?=nil) -> UIImage? {
        if(bundle==nil){
            return UIImage(named: name)
        }else {
            return UIImage(named: name, in: bundle, compatibleWith: nil)
        }
    }
    
    
    /*
     * ========日志输出========
     */
    public static func log(_ items: Any..., separator: String = " ", terminator: String = "\n") {
        #if DEBUG
            print(items, separator, terminator)
        #endif
    }
    
    /*
     * ========UI窗口控制区========
     */
    public static func loadingShow(_ msg: String?=nil) {
        if let strMsg=msg {
            SVProgressHUD.show(withStatus: strMsg)
        }else {
            SVProgressHUD.show()
        }
    }
    public static func loadingShut() {
        SVProgressHUD.dismiss()
    }
    
    public static func toastShort(_ msg: String) {
        SVProgressHUD.showInfo(withStatus: msg)
    }
    
}
