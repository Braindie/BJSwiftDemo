//
//  NewsCell.swift
//  MyNews
//
//  Created by zhangwenjun on 2017/10/18.
//  Copyright © 2017年 zcgt_ios_01. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    
    var titleLabel : UILabel?
    var detailLabel : UILabel?
    var titleImage : UIImageView?
    

    //如果是Class定义的cell，不会调用哦
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //初始化
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.buildUI()
    }
    
    
    
    func buildUI(){
        
        titleImage = UIImageView.init(frame: CGRect(x: 10, y: 10, width: 100, height: 80))
        titleImage!.layer.cornerRadius = 5
        titleImage!.layer.masksToBounds = true
        titleImage?.backgroundColor = UIColor.groupTableViewBackground
        self.addSubview(titleImage!)
        
        titleLabel = UILabel.init(frame: CGRect(x: 120, y: 15, width: kScreenWidth-130, height: 30))
        titleLabel?.text = "你好吗"
        titleLabel?.font = UIFont.systemFont(ofSize: 18)
        self.addSubview(titleLabel!)
        
        detailLabel = UILabel.init(frame: CGRect(x: 120, y: 45, width: kScreenWidth-130, height: 50))
        detailLabel?.text = "hello hi how are you"
        detailLabel?.font = UIFont.systemFont(ofSize: 13)
        detailLabel?.numberOfLines = 2;
        detailLabel?.textColor = UIColor.darkGray
        self.addSubview(detailLabel!)
    
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    
    }

}
