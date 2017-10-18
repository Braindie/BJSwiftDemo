//
//  NewsCtrl.swift
//  MyNews
//
//  Created by zhangwenjun on 16/6/28.
//  Copyright © 2016年 zcgt_ios_01. All rights reserved.
//

import UIKit

class NewsCtrl: UIViewController {
    
//    let myTableView:UITableView = UITableView(frame:UIScreen.main.bounds, style:UITableViewStyle.plain)
//    myTableView.delegate = self
//    myTableView.dataSource = self

    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView()
        tableView.frame = self.view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        
        //使用代码定义cell好像不用注册
//        tableView.register(NewsCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension NewsCtrl : UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let identifier = "mainCell"
        let cell = NewsCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: identifier)
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
