//
//  NewsDetailCtrl.swift
//  MyNews
//
//  Created by zhangwenjun on 2017/10/19.
//  Copyright © 2017年 zcgt_ios_01. All rights reserved.
//

import UIKit
import WebKit

class NewsDetailCtrl: BJBaseViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    var model: NewsModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "详情"
        self.view.backgroundColor = UIColor.white
        
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: self.view.bounds, configuration: webConfiguration)
        webView.uiDelegate = self;
        view = webView
        
        let myURL = URL(string: self.model.url ?? "")
//        let myURL = URL(string: "http://mini.eastday.com/mobile/190612130417964.html")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
    }
}
