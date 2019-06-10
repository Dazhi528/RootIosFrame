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
            .subscribe(onNext: { bnRsps in
                UtHttp.putBnUser(bnRsps)
            }, onError: { error in
                print(error.rawString())
            }, onCompleted: {
                if let temp=UtHttp.getBnUser() {
                    print(temp)
                }else {
                    print("bnUser nil")
                }
            })
            .disposed(by: disposeBag)
    }

}

