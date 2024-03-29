//
//  RootScanViewController.swift
//  libroot
//
//  Created by wangzezhi on 2019/6/19.
//  Copyright © 2019 Dazhi528. All rights reserved.
//
import swiftScan
import FDFullscreenPopGesture
import AVFoundation

public protocol ProtScanResultDelegate: class {
    func scanResult(_ strResult: String)
}

extension RootScanViewController: LBXScanViewControllerDelegate {
    //处理扫描结果
    public func scanFinished(scanResult: LBXScanResult, error: String?) {
        if error != nil {
            protScanResultDelegate?.scanResult("")
            return
        }
        if let resultStr = scanResult.strScanned {
            protScanResultDelegate?.scanResult(resultStr)
        }
    }
}

public class RootScanViewController : LBXScanViewController {
    open weak var protScanResultDelegate: ProtScanResultDelegate?
    
    deinit {
        self.scanResultDelegate = nil
        self.protScanResultDelegate = nil
    }
    
    private let closeButton:UIButton = {
        let closeButton = UIButton(type: .custom)
        closeButton.size = CGSize(width: 60, height: 60)
        closeButton.titleLabel?.font = UtRoot.defaultBoldFontWithSize(14)
        closeButton.setImagePosition(UtRoot.getLibImage("ico_scan_close"),
                                    UtRoot.getLibString("libroot_scan_close"),
                                     .normal, .top, 10)
        return closeButton
    }()
    
    private let torchButton:UIButton = {
        let torchButton = UIButton(type: .custom)
        torchButton.size = CGSize(width: 60, height: 60)
        torchButton.titleLabel?.font = UtRoot.defaultBoldFontWithSize(14)
        torchButton.setImagePosition(UtRoot.getLibImage("ico_scan_torch"),
                                     UtRoot.getLibString("libroot_torch_open"),
                                     .normal, .top, 10)
        torchButton.setImagePosition(UtRoot.getLibImage("ico_scan_torch"),
                                     UtRoot.getLibString("libroot_torch_close"),
                                     .selected, .top, 10)
        return torchButton
    }()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        //
        self.scanResultDelegate = self
        //
        self.scanStyle?.anmiationStyle = .LineMove
        self.scanStyle?.animationImage = UtRoot.getLibImage("ico_scan_line")
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
        // 全局手势
        self.fd_prefersNavigationBarHidden = true // 隐藏导航条
        self.fd_interactivePopDisabled = true // 当前页面禁用返回手势(本页用按钮返回)
    }
    
    // self.fd_prefersNavigationBarHidden = true //全局手势库这句代替下面的隐藏
//    override public func viewWillAppear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        // 将显示时，隐藏导航条
//        self.navigationController?.setNavigationBarHidden(true, animated: true)
//    }
    
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
