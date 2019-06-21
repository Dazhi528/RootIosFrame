//
//  UIButton+Extension.swift
//  libroot
//
//  Created by wangzezhi on 2019/6/20.
//  Copyright © 2019 Dazhi528. All rights reserved.
//
import UIKit

public enum EnumButtonTitlePosition {
    case top // 标题在上，图片在下，位于按钮中间
    case left // 标题在左，图片在右，位于按钮中间
    case right // 默认位置，标题在右，图片在左，位于按钮中间
    case bottom // 标题在下，图片在上，位于按钮中间
}

public extension UIButton {
    
    /*
     * image按钮图片； title按钮标题；
     * state控制状态，例：.normal .selected
     * space图片与标题间隙
     * titlePosition标题位置
     */
    func set(image: UIImage?, title: String,
             state: UIControl.State,
             space: CGFloat = 0,
             titlePosition: EnumButtonTitlePosition = .right){
        self.setImage(image, for: state)
        self.setTitle(title, for: state)
        // 位置控制
        let imageSize=self.imageRect(forContentRect: self.frame).size
        let titleSize=self.titleRect(forContentRect: self.frame).size
        var imageInsets: UIEdgeInsets
        var titleInsets: UIEdgeInsets
        //
        switch (titlePosition){
        case .top:
            titleInsets = UIEdgeInsets(top: -(imageSize.height + titleSize.height + space),
                                       left: -(imageSize.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
        case .bottom:
            titleInsets = UIEdgeInsets(top: (imageSize.height + titleSize.height + space),
                                       left: -(imageSize.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
        case .left:
            titleInsets = UIEdgeInsets(top: 0, left: -(imageSize.width * 2), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0,
                                       right: -(titleSize.width * 2 + space))
        case .right:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -space)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        //
        self.titleEdgeInsets = titleInsets
        self.imageEdgeInsets = imageInsets
    }
    
    
}
