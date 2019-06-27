//
//  TestViewController.swift
//  libroot
//
//  Created by wangzezhi on 2019/6/12.
//  Copyright © 2019 Dazhi528. All rights reserved.
//
import UIKit
import RxSwift
import LibRoot

class TestViewController: RootViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "测试主页"
    }
    
    @IBAction func onClickTestApiLogin(_ sender: UIButton) {
        UtHttp.api("TmsLogin", BnRqstLogin("simon", UtHttp.md5Mid16("123456")))
            .mapperObject(type: BnUser.self) // 解析成BnUser对象
            .observeOn(MainScheduler.instance) // 切换到主线程
            .customSubscribe(disposeBag ,next: { bnRsps in
                if let strBnUser = bnRsps.toJSONString() {
                    self.msgBoxShow(strBnUser, ent: "知道了", esc: "", escCall: { _ in
                        UtRoot.toastShort("销毁方法回调")
                    })
                }
            })
    }
    
    
    @IBAction func onClickTestToScanPage(_ sender: UIButton) {
        let scanVC = RootScanViewController()
       // scanVC.scanResultDelegate = self
        //scanVC.fd_prefersNavigationBarHidden = true
        self.navigationController?.pushViewController(scanVC, animated: true)
    }
    
    @IBAction func onClickTestToListPage(_ sender: UIButton) {
        self.navigationController?.pushViewController(TestListController(), animated: true)
    }
    
    
}
