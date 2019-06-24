//
//  UIButton+Extension.swift
//  libroot
//
//  Created by wangzezhi on 2019/6/20.
//  Copyright © 2019 Dazhi528. All rights reserved.
//
import UIKit

public enum EnumButtonImagePosition {
    case top
    case left
    case right
    case bottom
}

public extension UIButton {
    
    func setImagePosition(_ image: UIImage?, _ title: String, _ state: UIControl.State, _ position: EnumButtonImagePosition, _ space: CGFloat=0) {
        self.setImage(image, for: state)
        self.setTitle(title, for: state)
        // 按钮宽度
        let buttonWidth=self.frame.size.width
        // imageView宽高
        var imageWidth: CGFloat! = 0.0
        var imageHeight: CGFloat! = 0.0
        imageWidth = self.imageView?.frame.size.width
        imageHeight = self.imageView?.frame.size.height
        // titleLabel宽高
        var labelWidth: CGFloat! = 0.0
        var labelHeight: CGFloat! = 0.0
        labelWidth = self.titleLabel?.intrinsicContentSize.width
        labelHeight = self.titleLabel?.intrinsicContentSize.height
//        let titleFont = self.titleLabel?.font!
//        let titleSize = title.size(withAttributes: [NSAttributedString.Key.font: titleFont!])
//        let labelWidth=titleSize.width
//        let labelHeight=titleSize.height
        //初始化imageEdgeInsets和labelEdgeInsets
        var imageEdgeInsets = UIEdgeInsets.zero
        var labelEdgeInsets = UIEdgeInsets.zero
        //根据style和space得到imageEdgeInsets和labelEdgeInsets的值
        switch position {
        case .top:
            imageEdgeInsets = UIEdgeInsets(top: -labelHeight-space/2, left: 0, bottom: 0, right: -labelWidth)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth!, bottom: -imageHeight-space/2, right: 0)
            break;
        case .left:
            let restSpaceHalf=(buttonWidth-imageWidth-labelWidth-space)/2
            if(restSpaceHalf<0){
                var offset = labelWidth + restSpaceHalf - buttonWidth/2
                offset = offset>0 ? offset : 0
                //
                imageEdgeInsets = UIEdgeInsets(top: 0, left: restSpaceHalf, bottom: 0, right: 0)
                labelEdgeInsets = UIEdgeInsets(top: 0, left: -offset, bottom: 0, right: restSpaceHalf-offset)
            }else {
                imageEdgeInsets = UIEdgeInsets(top: 0, left: -space/2, bottom: 0, right: 0)
                labelEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -space/2)
            }
            break;
        case .bottom:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -labelHeight-space/2, right: -labelWidth)
            labelEdgeInsets = UIEdgeInsets(top: -imageHeight-space/2, left: -imageWidth, bottom: 0, right: 0)
            break;
        case .right:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -labelWidth*2-space/2)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth*2-space/2, bottom: 0, right: 0)
            break;
        }
        self.titleEdgeInsets = labelEdgeInsets
        self.imageEdgeInsets = imageEdgeInsets
    }
    
    
}
