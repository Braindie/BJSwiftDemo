//
//  BJRxSwiftMVVMViewModel.swift
//  MyNews
//
//  Created by zhangwenjun on 2019/10/22.
//  Copyright © 2019 zcgt_ios_01. All rights reserved.
//


// 不能出现于UI有关的东西
import Foundation
import RxSwift

class BJRxSwiftMVVMViewModel {
    // 输出
    let usernameValid: Observable<Bool>
    let passwordValid: Observable<Bool>
    let everythingValid: Observable<Bool>
    
    // 输入 -> 输出
    init(
        username: Observable<String>,
        password: Observable<String>
        )
        {
        usernameValid = username
            .map { $0.count >= 6 }
            .share(replay: 1)
        
        passwordValid = password
            .map { $0.count >= 6 }
            .share(replay: 1)
        
        everythingValid = Observable.combineLatest(usernameValid, passwordValid) { $0 && $1 }
            .share(replay: 1)
        }
}
