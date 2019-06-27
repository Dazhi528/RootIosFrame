//
//  RootScanViewController.swift
//  libroot
//
//  Created by wangzezhi on 2019/6/19.
//  Copyright © 2019 Dazhi528. All rights reserved.
//
import swiftScan
import AVFoundation

public class RootScanViewController : LBXScanViewController {
    
    deinit {
        self.scanResultDelegate = nil
    }
    
    private let closeButton:UIButton = {
        let closeButton = UIButton(type: .custom)
        closeButton.size = CGSize(width: 60, height: 60)
        closeButton.titleLabel?.font = UtRoot.defaultBoldFontWithSize(14)
        closeButton.setImagePosition(UIImage(named: "ico_scan_close", in: kBundleImage, compatibleWith: nil),
                                     NSLocalizedString("libroot_scan_close", comment: ""),
                                     .normal, .top, 10)
        return closeButton
    }()
    
    private let torchButton:UIButton = {
        let torchButton = UIButton(type: .custom)
        torchButton.size = CGSize(width: 60, height: 60)
        torchButton.titleLabel?.font = UtRoot.defaultBoldFontWithSize(14)
        torchButton.setImagePosition(UIImage(named: "ico_scan_torch", in: kBundleImage, compatibleWith: nil),
                                     NSLocalizedString("libroot_torch_open", comment: ""),
                                     .normal, .top, 10)
        torchButton.setImagePosition(UIImage(named: "ico_scan_torch", in: kBundleImage, compatibleWith: nil),
                                     NSLocalizedString("libroot_torch_close", comment: ""),
                                     .selected, .top, 10)
        return torchButton
    }()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        //
        self.scanStyle?.anmiationStyle = .LineMove
        self.scanStyle?.animationImage = UIImage(named:"ico_scan_line")
        self.scanStyle?.colorAngle = UIColor("#358EE0")
        self.scanStyle?.photoframeAngleW = 24
        self.scanStyle?.photoframeAngleH = 24
        self.scanStyle?.photoframeLineW = 2
        self.arrayCodeType = [AVMetadataObject.ObjectType.qr,
                              AVMetadataObject.ObjectType.ean13,
                              AVMetadataObject.ObjectType.ean8,
                              AVMetadataObject.ObjectType.code128,
                              AVMetadataObject.ObjectType.code93,
                              AVMetadataObject.ObjectType.code39]
        self.scanStyle?.photoframeAngleStyle = .On;
        self.scanStyle?.colorRetangleLine = .clear
        self.isOpenInterestRect = true
        //
        // self.edgesForExtendedLayout = UIRectEdge.top
        // 按钮位置
        closeButton.left = 67
        closeButton.bottom = kScreenHeight - kSafeAreaInsets.bottom - 55
        torchButton.right =  kScreenWidth - 67
        torchButton.bottom = kScreenHeight - kSafeAreaInsets.bottom - 55
        closeButton.addTarget(self, action: #selector(closeScan), for: .touchUpInside)
        torchButton.addTarget(self, action: #selector(torchCtrl), for: .touchUpInside)
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        // 将显示时，隐藏导航条
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // 已显示时，添加按钮
        self.view.addSubview(closeButton)
        self.view.addSubview(torchButton)
    }
    
    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // 将销毁时，显示导航条，不影响其他有导航条的页面
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
}


private extension RootScanViewController {
    @objc private func closeScan()->Void{
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func torchCtrl()->Void{
        torchButton.isSelected = !torchButton.isSelected
        self.scanObj?.setTorch(torch: torchButton.isSelected)
    }
}
