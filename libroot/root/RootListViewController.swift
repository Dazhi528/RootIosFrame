//
//  XHBaseListViewController.swift
//  xinhua
//
//  Created by xiangming on 2019/5/17.
//  Copyright © 2019 zmrj. All rights reserved.
//
import UIKit
import DZNEmptyDataSet

public class RootListViewController: RootViewController {
    open var booLoaded:Bool = false // 默认未加载
    open var booNeedRefresh: Bool = false //是否需要刷新
    open var emptyContentHint:String = NSLocalizedString("libroot_empty_list", comment: "") //空内容提示信息
    
}


extension RootListViewController: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
   
    public func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let attributedStr  = NSAttributedString(string: emptyContentHint, attributes: [NSAttributedString.Key.font : UtRoot.defaultFontWithSize(14), NSAttributedString.Key.foregroundColor : UIColor("#A3A3A3")])
        return attributedStr
    }
    public func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
        return #imageLiteral(resourceName: "empty_bg")
    }
    public func emptyDataSetShouldDisplay(_ scrollView: UIScrollView!) -> Bool {
        return booLoaded
    }

    public func emptyDataSetDidAppear(_ scrollView: UIScrollView!) {
        self.booNeedRefresh = true
    }

}
