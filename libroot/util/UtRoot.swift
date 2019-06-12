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
     * ========UI窗口控制区========
     */
    public static func loadingShow(_ msg: String) {
        SVProgressHUD.show(withStatus: msg)
    }
    public static func loadingShut() {
        SVProgressHUD.dismiss()
    }
    
    public static func toastShort(_ msg: String) {
        SVProgressHUD.showInfo(withStatus: msg)
    }
    
}
