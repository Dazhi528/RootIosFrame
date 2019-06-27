//
//  AppDelegate.swift
//  libroot
//
//  Created by wangzezhi on 2019/6/3.
//  Copyright © 2019 Dazhi528. All rights reserved.
//
import UIKit
import SVProgressHUD

open class RootApp: UIResponder, UIApplicationDelegate {

    open func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //配置进度指示
        SVProgressHUD.setMinimumDismissTimeInterval(1) // 显示间隔1秒
        SVProgressHUD.setDefaultStyle(.dark)
        SVProgressHUD.setDefaultMaskType(.black)
        SVProgressHUD.setValue(nil, forKey: "infoImage")
        SVProgressHUD.setValue(nil, forKey: "errorImage")
        SVProgressHUD.setValue(nil, forKey: "successImage")
        SVProgressHUD.setImageViewSize(.zero)
        //
        return true
    }
   

}

