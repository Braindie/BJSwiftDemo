//
//  MediaCtrl.swift
//  MyNews
//
//  Created by zhangwenjun on 16/6/28.
//  Copyright © 2016年 zcgt_ios_01. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class MediaCtrl: BJBaseViewController {
    
    var myDataArray = NSMutableArray()
    
    let tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "网络"
        
        self.buildUI()
        
        self.requestData()
    }
    
    func buildUI(){
        self.tableView.frame = self.view.bounds
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.view.addSubview(self.tableView)
    }
    
    func requestData(){
        
        Alamofire.request("http://v.juhe.cn/toutiao/index?key=c76f60c92d392d0a59d7cac0cae97a44",method: .get).responseJSON{ (responds) in
            
            let json = responds.result.value
            let dic = JSON(json!)
            if dic["error_code"] == 0 {
                print("请求成功")
                print(dic["result"]["data"])
                
                let dataArray = dic["result"]["data"]
                for index in 0...dataArray.count-1 {
                    let model = NewsModel()
                    model.title = dataArray[index]["title"].string
                    model.thumbnail_pic_s = dataArray[index]["thumbnail_pic_s"].string
                    model.author_name = dataArray[index]["author_name"].string
                    model.date = dataArray[index]["date"].string
                    model.category = dataArray[index]["category"].string
                    model.url = dataArray[index]["url"].string
                    self.myDataArray.add(model)
                }
                self.tableView.reloadData()
                
            }else {
                print("请求失败")
            }
        }
    }
}

extension MediaCtrl : UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "mainCell"
        let cell = NewsCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: identifier)
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        if self.myDataArray.count != 0  {
            let model: NewsModel = self.myDataArray[indexPath.row] as! NewsModel
            cell.titleLabel?.text = model.title
            cell.detailLabel?.text = model.author_name
            let url = URL(string: model.thumbnail_pic_s ?? "")
            cell.titleImage?.kf.setImage(with: url)
        }
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
        vc.model = self.myDataArray[indexPath.row] as? NewsModel
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
        self.hidesBottomBarWhenPushed = false//这样back回来的时候，tabBar会恢复正常显示，不然就。。。哈哈。
    }
}
