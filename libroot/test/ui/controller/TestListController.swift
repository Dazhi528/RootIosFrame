//
//  TestListController.swift
//  libroot
//
//  Created by wangzezhi on 2019/6/25.
//  Copyright © 2019 Dazhi528. All rights reserved.
//
import UIKit
import RxCocoa

class TestListController: RootListViewController {
    @IBOutlet weak var tabTest: UITableView!
    let lsBn:[String] = ["新东方卡机司法局发就发甲案件发房间啊发发看大家发空新东方卡机司法局发就发甲案件发房间啊发发看大家发空新东方卡机司法局发就发甲案件发房间啊发发看大家发空新东方卡机司法局发就发甲案件发房间啊发发看大家发空新东方卡机司法局发就发甲案件发房间啊发发看大家发空新东方卡机司法局发就发甲案件发房间啊发发看大家发空",
                         "2", "3"]
//    let lsBn:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        self.title="空列表页"
        // 设置空数据源和代理
        self.tabTest.emptyDataSetSource=self
        self.tabTest.emptyDataSetDelegate=self
        // 去除默认自带的分割线
//        self.tabTest.tableFooterView = UIView();
        self.tabTest.separatorStyle = .none
        // 设置数据源和代理
        self.tabTest.dataSource=self
        self.tabTest.delegate=self
        // 注册重用列表单元格
        tabTest.register(UINib(nibName: "CellTestList", bundle: nil), forCellReuseIdentifier: "CellTestList")
        // 把列表视图添加到当前视图
        self.view.addSubview(tabTest)
    }


}


extension TestListController: UITableViewDataSource, UITableViewDelegate {

    //返回cell行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.lsBn.count
    }

    //返回显示的cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //获取复用cell，如果没有，自己创建一个新的cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellTestList", for: indexPath) as! CellTestList
        cell.lbTitle.numberOfLines=0 // 设置自动换行
        cell.lbTitle.text=self.lsBn[indexPath.row]
        cell.btTest.rx.tap.customSubscribe(disposeBag, next:{
            UtRoot.toastShort("当前行：\(indexPath.row)")
        })
        return cell
    }


}
