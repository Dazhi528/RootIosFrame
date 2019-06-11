//
//  ViewController.swift
//  libroot
//
//  Created by wangzezhi on 2019/6/3.
//  Copyright © 2019 Dazhi528. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickCommit(_ sender: Any) {
        UtHttp.api("TmsLogin", BnRqstLogin("simon", UtHttp.md5Mid16("123456")))
            .mapperObject(type: BnUser.self) // 解析成BnUser对象
            .observeOn(MainScheduler.instance) // 切换到主线程
            .subscribe(onNext: { bnRsps in
                UtHttp.putBnUser(bnRsps)
            }, onError: { error in
                print(error)
            })
            .disposed(by: disposeBag)
    }
    
}

