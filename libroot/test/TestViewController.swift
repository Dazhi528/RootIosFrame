//
//  TestViewController.swift
//  libroot
//
//  Created by wangzezhi on 2019/6/12.
//  Copyright © 2019 Dazhi528. All rights reserved.
//
import UIKit
import RxSwift

class TestViewController: RootViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "测试页面"
    }
    
    @IBAction func onClickTest(_ sender: UIButton) {
        UtHttp.api("TmsLogin", BnRqstLogin("simon", UtHttp.md5Mid16("123456")), msg: "加载中")
            .mapperObject(type: BnUser.self) // 解析成BnUser对象
            .observeOn(MainScheduler.instance) // 切换到主线程
            .customSubscribe(disposeBag ,next: { bnRsps in
                UtHttp.putBnUser(bnRsps)
            })
    }
    
    
}
