//
//  RootViewController.swift
//  libroot
//
//  Created by wangzezhi on 2019/6/10.
//  Copyright © 2019 Dazhi528. All rights reserved.
//
import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarUI()
    }
    
    private func setNavigationBarUI()->Void{
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = UIColor.white
        let backgroundImage = UIColor(navigationbar_bg)
            .asImage(CGSize(width: SCREEN_WIDTH, height: navigationbar_height))
        self.navigationController?.navigationBar
            .setBackgroundImage(backgroundImage, for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage.init()
        self.buildNavigationQuit()
    }
    
    private func buildNavigationQuit() -> Void {
        //icon_back
        if(self.navigationController?.viewControllers.count ??  0  > 1){
            let backButton = UIButton(type: .custom)
            backButton.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
            backButton.setImage(UIImage(named: "icon_back"), for: .normal)
            backButton.setImage(UIImage(named: "icon_back"), for: .highlighted)
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
