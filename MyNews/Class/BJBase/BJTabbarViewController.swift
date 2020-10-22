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
        
        self.view.backgroundColor = UIColor.white
        
        let vc1 = NewsCtrl ()
        let item1 : UITabBarItem = UITabBarItem (title: "Layout", image: UIImage(named: "NewsImage"), selectedImage: UIImage(named: "NewsImageHigh"))
        vc1.tabBarItem = item1
        let nav1: UINavigationController = UINavigationController.init(rootViewController: vc1)
        
        let vc2 = BJAnimationCtrl ()
        let item2 : UITabBarItem = UITabBarItem (title: "Draw", image: UIImage(named: "ReadImage"), selectedImage: UIImage(named: "ReadImageHigh"))
        vc2.tabBarItem = item2
        let nav2: UINavigationController = UINavigationController.init(rootViewController: vc2)
        
        let vc3 = BJNetworkCtrl ()
        let item3 : UITabBarItem = UITabBarItem (title: "Data", image: UIImage(named: "MediaImage"), selectedImage: UIImage(named: "MediaImageHigh"))
        vc3.tabBarItem = item3
        let nav3: UINavigationController = UINavigationController.init(rootViewController: vc3)
        
        let vc4 = DiscoverCtrl ()
        let item4 : UITabBarItem = UITabBarItem (title: "Frame", image: UIImage(named: "DisImage"), selectedImage: UIImage(named: "DisImageHigh"))
        vc4.tabBarItem = item4
        let nav4: UINavigationController = UINavigationController.init(rootViewController: vc4)
        
        let vc5 = MeCtrl ()
        let item5 : UITabBarItem = UITabBarItem (title: "Func", image: UIImage(named: "MeImage"), selectedImage: UIImage(named: "MeImageHigh"))
        vc5.tabBarItem = item5
        let nav5: UINavigationController = UINavigationController.init(rootViewController: vc5)
        
        self.viewControllers = [nav1, nav2, nav3, nav4, nav5]
    }
}
