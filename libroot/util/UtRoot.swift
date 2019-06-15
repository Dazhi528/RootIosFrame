//
//  UtRoot.swift
//  libroot
//
//  Created by wangzezhi on 2019/6/5.
//  Copyright © 2019 Dazhi528. All rights reserved.
//

import Foundation
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
