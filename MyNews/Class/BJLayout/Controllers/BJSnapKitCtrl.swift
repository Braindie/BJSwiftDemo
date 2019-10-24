//
//  BJSnapKitCtrl.swift
//  MyNews
//
//  Created by zhangwenjun on 2019/10/24.
//  Copyright © 2019 zcgt_ios_01. All rights reserved.
//

import UIKit
import SnapKit

class BJSnapKitCtrl: BJBaseViewController {
    
    lazy var redView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "SnapKit"
        
        redView.backgroundColor = UIColor.red
        view.addSubview(redView)
        redView.snp.makeConstraints { (make) in
            make.size.equalTo(100)
            make.center.equalToSuperview()
        }
    }
}
