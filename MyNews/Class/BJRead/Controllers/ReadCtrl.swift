//
//  ReadCtrl.swift
//  MyNews
//
//  Created by zhangwenjun on 16/6/28.
//  Copyright © 2016年 zcgt_ios_01. All rights reserved.
//

import UIKit
import Kingfisher

class ReadCtrl: BJBaseViewController {
    
    var myTableView: UITableView!
    
    var myDataArray: NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.buildUI()
        
        self.requestData()
    }
    
    func requestData() {
        let path = Bundle.main.path(forResource: "wotMain", ofType: "json")
        
        let data = NSData.init(contentsOfFile: path ?? "")
        
        do {
            let dict: NSDictionary = try JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions()) as! NSDictionary
            print(dict)
            self.myDataArray = NSMutableArray.init(array: (dict.object(forKey: "data") as! NSArray))
            
        } catch {
            
        }
        self.myTableView.reloadData()
    }
    
    func buildUI() {
        self.myTableView = UITableView.init(frame: self.view.bounds, style: UITableView.Style.plain)
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
        self.myTableView.estimatedRowHeight = 150
        self.myTableView.rowHeight = UITableView.automaticDimension
        self.myTableView.sectionFooterHeight = 5
        self.myTableView.sectionHeaderHeight = 5
        self.view.addSubview(self.myTableView)
        
        //使用xib好像需要注册
        self.myTableView.register(UINib(nibName:"ReadCell" ,bundle:nil), forCellReuseIdentifier: "ReadCell")
    }
}


extension ReadCtrl : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let readId = "ReadCell"
        let cell: ReadCell = tableView.dequeueReusableCell(withIdentifier: readId, for: indexPath) as! ReadCell
        if self.myDataArray.count != 0 {
            let dic: NSDictionary = self.myDataArray[indexPath.row] as! NSDictionary
            cell.titleLabel.text = dic.object(forKey: "title") as? String
            cell.detailLabel.text = dic.object(forKey: "digest") as? String
            let urlStr = dic.object(forKey: "pictureUrl") as? String
            let url = URL(string: urlStr ?? "")
            cell.titleImage?.kf.setImage(with: url)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}







