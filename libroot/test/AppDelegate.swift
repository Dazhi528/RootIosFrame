//
//  AppDelegate.swift
//  libroot
//
//  Created by wangzezhi on 2019/6/3.
//  Copyright © 2019 Dazhi528. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: RootApp {
    var window: UIWindow?

    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // 扩展内容
        self.window=UIWindow.init(frame: UIScreen.main.bounds)
        let rootViewController=TestViewController()
        let navigationController=RootNavigationController(rootViewController: rootViewController)
        self.window?.rootViewController=navigationController
        self.window?.makeKeyAndVisible()
        // 调用父类方法
        return super.application(application, didFinishLaunchingWithOptions:launchOptions)
    }
    
    
}

