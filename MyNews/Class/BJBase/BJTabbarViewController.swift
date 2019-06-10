//
//  BJTabbarViewController.swift
//  MyNews
//
//  Created by zhangwenjun on 2019/6/10.
//  Copyright © 2019 zcgt_ios_01. All rights reserved.
//

import Foundation
import UIKit

class BJTabbarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.red
        
        let vc1 = NewsCtrl ()
        let item1 : UITabBarItem = UITabBarItem (title: "首页", image: UIImage(named: "NewsImage"), selectedImage: UIImage(named: "NewsImageHigh"))
        vc1.tabBarItem = item1
        
        let vc2 = ReadCtrl ()
        let item2 : UITabBarItem = UITabBarItem (title: "阅读", image: UIImage(named: "ReadImage"), selectedImage: UIImage(named: "ReadImageHigh"))
        vc2.tabBarItem = item2
        
        let vc3 = MediaCtrl ()
        let item3 : UITabBarItem = UITabBarItem (title: "媒体", image: UIImage(named: "MediaImage"), selectedImage: UIImage(named: "MediaImageHigh"))
        vc3.tabBarItem = item3
        
        let vc4 = DiscoverCtrl ()
        let item4 : UITabBarItem = UITabBarItem (title: "发现", image: UIImage(named: "DisImage"), selectedImage: UIImage(named: "DisImageHigh"))
        vc4.tabBarItem = item4
        
        let vc5 = MeCtrl ()
        let item5 : UITabBarItem = UITabBarItem (title: "我的", image: UIImage(named: "MeImage"), selectedImage: UIImage(named: "MeImageHigh"))
        vc5.tabBarItem = item5
        
        self.viewControllers = [vc1, vc2, vc3, vc4, vc5]
        
    }
}
