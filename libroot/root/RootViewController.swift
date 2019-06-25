//
//  RootViewController.swift
//  libroot
//
//  Created by wangzezhi on 2019/6/10.
//  Copyright © 2019 Dazhi528. All rights reserved.
//
import UIKit
import RxSwift

public class RootViewController: UIViewController {
    public let disposeBag = DisposeBag()

    override public func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarUI()
    }
    
    
    /*
     * 常用消息窗口
     * 调用实例：
     * self.msgBoxShow(strBnUser, esc: "", escCall: { _ in
     *  UtRoot.toastShort("销毁方法回调")
     * })
     */
    public func msgBoxShow(_ msg: String,
                           ent: String?=nil, entCall: ((UIAlertAction)->Void)?=nil,
                           esc: String?=nil, escCall: ((UIAlertAction)->Void)?=nil) {
        // 创建对话框控制器
        let dialog=UIAlertController(title: nil, message: msg, preferredStyle: .alert)
        // 创建动作
        let actionEnt=UIAlertAction(
            title: ent ?? NSLocalizedString("libroot_bt_ent", comment: ""),
            style: .default, handler: entCall)
        var actionEsc: UIAlertAction?=nil
        if(esc != nil){
            actionEsc=UIAlertAction(title: esc=="" ? NSLocalizedString("libroot_bt_esc", comment: "") : esc,
                                    style: .cancel, handler: escCall)
        }
        // 添加动作
        dialog.addAction(actionEnt)
        if(actionEsc != nil) {
            dialog.addAction(actionEsc!)
        }
        // 显示对话框
//        weak var weakSelf = self
//        weakSelf?.present(dialog, animated: true, completion: nil)
        self.present(dialog, animated: true, completion: nil)
    }
        
    
    private func setNavigationBarUI()->Void{
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = UIColor.white
        let backgroundImage = UIColor(navigationbar_bg)
            .asImage(CGSize(width: kScreenWidth, height: kNavigationbarHeight))
        self.navigationController?.navigationBar
            .setBackgroundImage(backgroundImage, for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage.init()
        self.buildNavigationQuit()
    }
    
    private func buildNavigationQuit() -> Void {
        if(self.navigationController?.viewControllers.count ??  0  > 1){
            let backButton = UIButton(type: .custom)
            backButton.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
            backButton.setImage(UIImage(named: "ico_arrow_back"), for: .normal)
            backButton.setImage(UIImage(named: "ico_arrow_back"), for: .highlighted)
            backButton.imageEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
            backButton.addTarget(self, action: #selector(quitCurrentController), for: .touchUpInside)
            let backItem = UIBarButtonItem(customView: backButton)
            self.navigationItem.leftBarButtonItem = backItem
        }
    }
    
    @objc private func quitCurrentController()->Void{
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
