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
        viewModel = BJRxSwiftMVVMViewModel(
            username: usernameOutlet.rx.text.orEmpty.asObservable(),
            password: passwordOutlet.rx.text.orEmpty.asObservable()
        )
        
        viewModel.usernameValid
            .bind(to: passwordOutlet.rx.isEnabled)
            .disposed(by: disposeBag)
        
        viewModel.everythingValid
            .bind(to: doSomethingOutlet.rx.isEnabled)
            .disposed(by: disposeBag)
        
        doSomethingOutlet.rx.tap
            .subscribe(onNext: { [weak self] in self?.showAlert() })
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
    }
    
    func showAlert() {
        print("登录成功")
    }
}
