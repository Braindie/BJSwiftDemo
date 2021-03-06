//
//  NewsCtrl.swift
//  MyNews
//
//  Created by zhangwenjun on 16/6/28.
//  Copyright © 2016年 zcgt_ios_01. All rights reserved.
//

import UIKit
import SwiftUI

class NewsCtrl: BJBaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    var myDataArray = ["SwiftUI", "SnapKit"]
       
    let tableView = UITableView()


    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Layout"

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
            if #available(iOS 13.0, *) {
                let contentView = SwiftUIView()
                let vc = UIHostingController(rootView: contentView)
                self.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(vc, animated: true)
                self.hidesBottomBarWhenPushed = false
            }
        } else if indexPath.row == 1 {
            let vc = BJSnapKitCtrl()
            self.hidesBottomBarWhenPushed = true
          self.navigationController?.pushViewController(vc, animated: true)
            self.hidesBottomBarWhenPushed = false
        }
    }
}
