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

struct Music {
    let name: String
    let singer: String
    
    init(name: String, singer: String) {
        self.name = name
        self.singer = singer
    }
}

extension Music: CustomStringConvertible {
    var description: String {
        return "name: \(name) singer: \(singer)"
    }
}

class BJRxSwiftMVVMViewModel {
    // Observable 可以用于描述元素异步产生的序列。
    let usernameValid: Observable<Bool>
    let passwordValid: Observable<Bool>
    let everythingValid: Observable<Bool>
    
    let arrayData = Observable.just([
        Music(name: "十年", singer: "陈奕迅"),
        Music(name: "双节棍", singer: "周杰伦"),
        Music(name: "野生动物", singer: "李荣浩")
    ])
        
    
    // 初始化方法
    init(username: Observable<String>, password: Observable<String>){
        usernameValid = username
            .map { $0.count >= 6 } // map 操作符将源 Observable 的每个元素应用你提供的转换方法，然后返回含有转换结果的 Observable。这里是判断输入是否大于等于6位
            .share(replay: 1)
        
        passwordValid = password
            .map { $0.count >= 6 }
            .share(replay: 1)
        
        everythingValid = Observable.combineLatest(usernameValid, passwordValid) { $0 && $1 }
            .share(replay: 1) // 将多个 Observables 中最新的元素通过一个函数组合起来，然后将这个组合的结果发出来。
    }
}
