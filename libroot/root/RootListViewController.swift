//
//  XHBaseListViewController.swift
//  xinhua
//
//  Created by xiangming on 2019/5/17.
//  Copyright © 2019 zmrj. All rights reserved.
//
import UIKit
import DZNEmptyDataSet

/*
 * 用法：继承此类的子类中设置UITableView的空数据集和空代理
 * 例如：
 * self.tabTest.emptyDataSetSource=self
 * self.tabTest.emptyDataSetDelegate=self
 * 备注：去除默认自带的分割线
 * self.tabTest.separatorStyle = .none
 */
open class RootListViewController: RootViewController {
    // 空内容提示信息(外部可设置该字符串，从而改变提示信息)
    public var emptyContentHint:String = UtRoot.getLibString("libroot_empty_list")
}


extension RootListViewController: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    
    // 空列表提示标题
    open func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let attributedStr  = NSAttributedString(string: emptyContentHint, attributes: [NSAttributedString.Key.font : UtRoot.defaultFontWithSize(14), NSAttributedString.Key.foregroundColor : UIColor("#A3A3A3")])
        return attributedStr
    }
    
    // 空列表提示图片
    open func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
        return UtRoot.getLibImage("ico_empty_list")
    }
    
    
    
    //    open var booLoaded:Bool = false // 默认未加载
    //    open var booNeedRefresh: Bool = false //是否需要刷新
//    public func emptyDataSetShouldDisplay(_ scrollView: UIScrollView!) -> Bool {
//        return booLoaded
//    }
//    //
//    public func emptyDataSetDidAppear(_ scrollView: UIScrollView!) {
//        self.booNeedRefresh = true
//    }

}
