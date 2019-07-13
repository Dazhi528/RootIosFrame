//
//  SVProgressHUD+Extension.swift
//  LibRoot
//
//  Created by wangzezhi on 2019/7/8.
//  Copyright © 2019 Dazhi528. All rights reserved.
//

import SVProgressHUD

extension SVProgressHUD {
    
    @objc dynamic static func setTextAlignmentLeft() {
        // 根据方法名获取方法对应的SEL(selector)类型数据
        let selSharedView = NSSelectorFromString("sharedView")
        // 根据SEL获取方法指针IMP(implementation)
        let impSharedView = self.method(for: selSharedView)
        // 根据IMP定义方法
        // @convention(swift) : 表明这个是一个swift的闭包
        // @convention(block) ：表明这个是一个兼容oc的block的闭包
        // @convention(c) : 表明这个是兼容c的函数指针的闭包
        // 由于IMP是函数指针，所以接收时需要指定@convention(c)
        typealias mClosure = @convention(c) (AnyObject, Selector) -> SVProgressHUD
        // 将函数指针强转为兼容函数指针的闭包
        let funSharedView = unsafeBitCast(impSharedView, to: mClosure.self)
        // 调用方法
        let instance = funSharedView(self, selSharedView)
        // kvc
        let statusLabel = instance.value(forKey: "_statusLabel") as? UILabel
        statusLabel?.textAlignment = NSTextAlignment.left
    }
    
}
