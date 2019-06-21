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
    
    let closeButton:UIButton = {
        let closeButton = UIButton(type: .custom)
        closeButton.size = CGSize(width: 60, height: 60)
        closeButton.titleLabel?.font = UtRoot.defaultBoldFontWithSize(14)
        closeButton.set(image: UIImage(named: "ico_scan_close"),
                        title: NSLocalizedString("libroot_scan_close", comment: ""),
                        state: .normal, space: 10, titlePosition: .bottom)
        return closeButton
    }()
    
    let torchButton:UIButton = {
        let torchButton = UIButton(type: .custom)
        torchButton.size = CGSize(width: 60, height: 60)
        torchButton.titleLabel?.font = UtRoot.defaultBoldFontWithSize(14)
        torchButton.set(image: UIImage(named: "ico_scan_torch"),
                        title: NSLocalizedString("libroot_torch_open", comment: ""),
                        state: .normal, space: 10, titlePosition: .bottom)
        torchButton.set(image: UIImage(named: "ico_scan_torch"),
                        title: NSLocalizedString("libroot_torch_close", comment: ""),
                        state: .selected, space: 10, titlePosition: .bottom)
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
        self.edgesForExtendedLayout = UIRectEdge.top
        // 按钮位置
        closeButton.left = 67
        closeButton.bottom = kScreenHeight - kSafeAreaInsets.bottom - 55
        torchButton.right =  kScreenWidth - 67
        torchButton.bottom = kScreenHeight - kSafeAreaInsets.bottom - 55
        closeButton.addTarget(self, action: #selector(closeScan), for: .touchUpInside)
        torchButton.addTarget(self, action: #selector(torchCtrl), for: .touchUpInside)
    }
    
    
    
}


private extension RootScanViewController {
    @objc func closeScan()->Void{
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func torchCtrl()->Void{
        torchButton.isSelected = !torchButton.isSelected
        self.scanObj?.setTorch(torch: torchButton.isSelected)
    }
}
