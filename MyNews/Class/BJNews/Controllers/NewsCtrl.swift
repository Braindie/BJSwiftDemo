//
//  NewsCtrl.swift
//  MyNews
//
//  Created by zhangwenjun on 16/6/28.
//  Copyright © 2016年 zcgt_ios_01. All rights reserved.
//

import UIKit
import Alamofire

class NewsCtrl: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.buildUI()
        
        self.requestData()
        

        
    }
    
    func buildUI(){
        let tableView = UITableView()
        tableView.frame = self.view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        
        //使用代码定义cell好像不用注册
        //        tableView.register(NewsCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
    }
    
    func requestData(){
        
//        let parameters:Dictionary = ["key":"93c921ea8b0348af8e8e7a6a273c41bd"]
        Alamofire.request("http://116.211.167.106/api/live/aggregation?uid=133825214&interest=1",method: .get).responseJSON{ (responds) in
            
            
            print("----------\(responds)")

        }
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = NewsDetailCtrl.init()
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
        self.hidesBottomBarWhenPushed = false//这样back回来的时候，tabBar会恢复正常显示，不然就。。。哈哈。
        
    }
    
}
