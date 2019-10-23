//
//  BJNetworkCtrl.swift
//  MyNews
//
//  Created by zhangwenjun on 2019/10/23.
//  Copyright © 2019 zcgt_ios_01. All rights reserved.
//

import UIKit

class BJNetworkCtrl: BJBaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    var myDataArray = ["Alamofire", "JSONSerialization"]
    
    let tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "网络"

        self.tableView.frame = self.view.bounds
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.view.addSubview(self.tableView)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myDataArray.count
    }
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        let identifier = "mainCell"
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: identifier)
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.textLabel?.text = self.myDataArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            let vc = MediaCtrl.init()
            self.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
            self.hidesBottomBarWhenPushed = false//这样back回来的时候，tabBar会恢复正常显示，不然就。。。哈哈。
        } else if indexPath.row == 1 {
            let vc = ReadCtrl.init()
            self.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
            self.hidesBottomBarWhenPushed = false
        }
    }
}
