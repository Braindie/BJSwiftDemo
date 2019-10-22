//
//  RxSwiftController.swift
//  MyNews
//
//  Created by zhangwenjun on 2019/10/22.
//  Copyright © 2019 zcgt_ios_01. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift


class RxSwiftController: UIViewController {
    
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let logInBtn = UIButton()
    
    
    var disposeBag = DisposeBag()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "RxSwift"
        

        self.buildUI()
    }
    
    func buildUI() {
        self.usernameTextField.frame = CGRect.init(x: 20, y: 100, width: 200, height: 40)
        self.usernameTextField.borderStyle = UITextField.BorderStyle.roundedRect
        self.view.addSubview(self.usernameTextField)
        
        self.passwordTextField.frame = CGRect.init(x: 20, y: 150, width: 200, height: 40)
        self.passwordTextField.borderStyle = UITextField.BorderStyle.roundedRect
        self.view.addSubview(self.passwordTextField)
        
        self.logInBtn.frame = CGRect.init(x: 20, y: 200, width: 200, height: 40)
        self.logInBtn.backgroundColor = UIColor.green
        self.logInBtn.setTitle("登录", for: UIControl.State.normal)
        self.view.addSubview(self.logInBtn)
        
        
        // 用户名是否为空
        let usernameValid = usernameTextField.rx.text.orEmpty
            .map { $0.count >= 6}
            .share(replay: 1)
        
        // 根据用户名是否有效判断密码框是否可输入
        usernameValid
            .bind(to: passwordTextField.rx.isEnabled)
            .disposed(by: disposeBag) // 就是将绑定的生命周期交给 disposeBag 来管理。当 disposeBag 被释放的时候，那么里面尚未清除的绑定也就被清除了。这就相当于是在用 ARC 来管理绑定的生命周期。
        
        
        // 密码是否为空
        let passwordValid = passwordTextField.rx.text.orEmpty
            .map { $0.count >= 6}
            .share(replay: 1)
        
        
        // 两项是否都符合条件
        let everythingValid = Observable.combineLatest(
            usernameValid,
            passwordValid
        ) { $0 && $1}
        .share(replay: 1)
        
        // 根据两项都符合判断按钮是否可点击
        everythingValid
            .bind(to: logInBtn.rx.isEnabled)
            .disposed(by: disposeBag)
        
        
        // 按钮点击事件
        logInBtn.rx.tap
            .subscribe(onNext: { [weak self] in self?.showAlert() })
            .disposed(by: disposeBag)
        
    }
    
    func showAlert() {
        print("登录成功")
    }
}
