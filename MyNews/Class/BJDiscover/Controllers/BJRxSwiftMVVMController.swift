//
//  BJRxSwiftMVVMController.swift
//  MyNews
//
//  Created by zhangwenjun on 2019/10/22.
//  Copyright © 2019 zcgt_ios_01. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class BJRxSwiftMVVMController: UIViewController {
    
    let usernameOutlet = UITextField()
    let passwordOutlet = UITextField()
    let doSomethingOutlet = UIButton()
    
    var tableView: UITableView!
    
    
    var disposeBag = DisposeBag()
    
    // 逻辑层，它将用户输入行为，转换成输出状态
    private var viewModel: BJRxSwiftMVVMViewModel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.buildUI()
        
        // 主要负责数据绑定
        self.bindData()

    }
    
    // 绑定数据
    func bindData() {
        // 初始化ViewModel
        viewModel = BJRxSwiftMVVMViewModel(
            username: usernameOutlet.rx.text.orEmpty.asObservable(), // asObservable会返回一个Observable，可监听序列
            password: passwordOutlet.rx.text.orEmpty.asObservable()
        )
        
        viewModel.usernameValid
            .bind(to: passwordOutlet.rx.isEnabled) // UI 观察者
            .disposed(by: disposeBag) // 可被清除的资源
        
        viewModel.everythingValid
            .bind(to: doSomethingOutlet.rx.isEnabled)
            .disposed(by: disposeBag)
        
        doSomethingOutlet.rx.tap
            .subscribe(onNext: { [weak self] in self?.showAlert() }) // subscribe 创建观察者
            .disposed(by: disposeBag)
        
        
        
        viewModel.arrayData.bind(to: tableView.rx.items(cellIdentifier:"cell")) { _, music, cell in
            cell.textLabel?.text = music.name
            cell.detailTextLabel?.text = music.singer
        }.disposed(by: disposeBag)
        
        tableView.rx.modelSelected(Music.self)
            .subscribe(onNext: { music in print("选中的是\(music)")})
            .disposed(by: disposeBag)
    }
    
    // 初始化界面
    func buildUI() {
        self.usernameOutlet.frame = CGRect.init(x: 20, y: 100, width: 200, height: 40)
        self.usernameOutlet.borderStyle = UITextField.BorderStyle.roundedRect
        self.view.addSubview(self.usernameOutlet)
        
        self.passwordOutlet.frame = CGRect.init(x: 20, y: 150, width: 200, height: 40)
        self.passwordOutlet.borderStyle = UITextField.BorderStyle.roundedRect
        self.view.addSubview(self.passwordOutlet)
        
        self.doSomethingOutlet.frame = CGRect.init(x: 20, y: 200, width: 200, height: 40)
        self.doSomethingOutlet.backgroundColor = UIColor.green
        self.doSomethingOutlet.setTitle("登录", for: UIControl.State.normal)
        self.view.addSubview(self.doSomethingOutlet)
        
        self.tableView = UITableView.init(frame: CGRect.init(x: 20, y: 250, width: self.view.bounds.width-40, height: 300), style: UITableView.Style.plain);
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableView)
    }
    
    func showAlert() {
        print("登录成功")
    }
}
