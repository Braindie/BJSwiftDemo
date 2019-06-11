//
//  ReadCtrl.swift
//  MyNews
//
//  Created by zhangwenjun on 16/6/28.
//  Copyright © 2016年 zcgt_ios_01. All rights reserved.
//

import UIKit

class ReadCtrl: BJBaseViewController {
    
    var myTableView: UITableView!
    
    var myDataArray: NSMutableArray!
    
    
//    var baby = ["宝宝0","宝宝1","宝宝2","宝宝3","宝宝4","宝宝5","宝宝6","宝宝7","宝宝8","宝宝9","宝宝10","宝宝11"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        automaticallyAdjustsScrollViewInsets = false
        
        let path = Bundle.main.path(forResource: "wotMain", ofType: "json")
        _ = URL(fileURLWithPath: path!)
        
        let data = NSData.dataWithContentsOfMappedFile(path as! String) as! NSData
        
        let dict:NSDictionary = try!  JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions()) as! NSDictionary
//        myDataArray = dict.object(forKey: "data") as! NSArray as? NSMutableArray
        

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
        
        

        
                
  
//        let d:Data = Data(contentsOf: jsonURL)
        
//        let json:Any = JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.mutableContainers)
//        let jsonDic = jsonas!Dictionary<String,Any>
//        let datalist = jsonDic["data"]as!NSArray
//        print(datalist)//输出数据
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension ReadCtrl : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let readId = "ReadCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: readId, for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}







