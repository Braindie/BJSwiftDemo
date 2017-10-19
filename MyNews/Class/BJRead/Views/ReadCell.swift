//
//  ReadCell.swift
//  MyNews
//
//  Created by zhangwenjun on 2017/10/18.
//  Copyright © 2017年 zcgt_ios_01. All rights reserved.
//

import UIKit

class ReadCell: UITableViewCell {
    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
