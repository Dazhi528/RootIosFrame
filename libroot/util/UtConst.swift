//
//  UtConst.swift
//  libroot
//
//  Created by wangzezhi on 2019/6/10.
//  Copyright © 2019 Dazhi528. All rights reserved.
//
import UIKit
import DeviceKit

// 屏幕宽高
public let SCREEN_WIDTH  = UIScreen.main.bounds.size.width
public let SCREEN_HEIGHT = UIScreen.main.bounds.size.height

// 安全区域高度
public let safe_area_insets:UIEdgeInsets = {
    if #available(iOS 12.0, *){
        return UIWindow().safeAreaInsets
    }
    if Device().isOneOf([.iPhoneX, .simulator(.iPhoneX)]) {
        return UIEdgeInsets(top: 20, left: 0, bottom: 34, right: 0)
    }
    return UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
}()

// 导航栏高度
public let navigationbar_height:CGFloat = 44 + safe_area_insets.top


/*
 * ============全局颜色区============
 */
public let navigationbar_bg="#17a0fe"
