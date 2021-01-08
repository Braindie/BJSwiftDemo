//
//  BJPromiseKitController.swift
//  MyNews
//
//  Created by 张文军 on 2020/12/22.
//  Copyright © 2020 zcgt_ios_01. All rights reserved.
//

import UIKit
import PromiseKit

class BJPromiseKitController: BJBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         Promise: 灵活的异步操作，可成功可失败
         Guarantee: 灵活的异步操作，只可成功
         */
        
/*
    1.firstly() --
    2.then() -- 要求输入一个promise值并返回一个promise。then 方法就是把原来的回调写法分离出来，在异步操作执行完后，用链式调用的方式执行回调函数。
    3.ensure() --
    4.done() -- 可以输入一个promise值并返回一个空的promise。因此我们会在整个链式调用的末尾使用done()方法做终结。
    5.catch() -- 而 reject 方法就是把 Promise 的状态置为已失败（rejected），这时就能进到 catch 方法中，我们再次处理错误
    7.map() -- 是根据先前 promise 的结果，然后返回一个新的对象或值类型
    8.compactMap() -- 与 map() 类似，不过它是返回 Optional。比如我们返回 nil，则整个链会产生 PMKError.compactMap 错误。
    9.finally -- 不管前面是 fulfill 还是 reject，最终都会进入到 finally方法里来。
    10.get() -- 只有前面是完成状态（fulfilled）时才会调用
    11.tap() -- 不管前面是完成（fulfilled）还是失败（rejected）都会调用，同时它得到的是 Result<T>：
         
    12.when() -- 提供了并行执行异步操作的能力，并且只有在所有异步操作执行完后才执行回调
    13.race() -- race的用法与when一样，只不过when是等所有异步操作都执行完毕后才执行then回调。而race的话只要有一个异步操作执行完毕，就立刻执行then回调。
         
    14.after() --
         
*/
        
//        firstly {
//            self.cook()
//        }.then {
//            self.eat(data: $0)
//        }.ensure {
//
//        }.catch {_ in
//
//        }
        
//        after(seconds: 3).done {
//            print("开始")
//        }
        
        
//        cook(state: 1)
//            .map ({ (data) -> String in
//                return data + "，配上老鸭汤"
//            })
//            .get({ (data) in
//                print(data)
//            })
//            .then(eat)
//            .tap({ result in
//
//            })
//            .then(wash)
//            .done ({ (data) in
//                print(data)
//            })
//            .catch ({ (error) in
//                print(error)
//            })
        
        
        firstly {
            self.cook(state: 1)
        }.map { (data) -> String in
            return data + "+++配上老鸭汤"
        }.then { (data) in
            self.eat(data: data)
        }.then { (data) in
            self.wash(data: data)
        }.done { (data) in
            print(data)
        }.catch { (error) in
            print(error)
        }
        
        
//        when(fulfilled: cutUp(), boil())
//            .done { result1, result2 in
//                print(result1, result2)
//            }.catch { error in
//                print(error)
//            }
//
//        race(cutUp(), boil())
//            .done { data in
//                print(data)
//            }.catch { error in
//                print(error)
//            }

    }

    // 做饭
    func cook(state: Int) -> Promise<String> {
        let p = Promise<String> { resolver in
            print("开始做饭")
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2) {
                if state == 0 {
                    print("做饭完毕！\n")
                    resolver.fulfill("鸡蛋炒饭")
                } else {
                    print("做饭失败")
                    let error = NSError(domain: "PromiseKitTutorial", code: 0, userInfo: [NSLocalizedDescriptionKey: "烧焦的米饭"])
                    resolver.reject(error)
                }
            }
        }
        return p
    }
    
    // 吃饭
    func eat(data: String) -> Guarantee<String> {
        print("开始吃饭：" + data)
        let p = Guarantee<String> { seal in
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2) {
                print("吃饭完毕！\n")
                seal("一个碗和一双筷子")
            }
        }
        return p
    }
    
    // 洗碗
    func wash(data: String) -> Promise<String> {
        print("开始洗碗+++" + data)
        let p = Promise<String> { resolver in
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                print("洗碗完毕！\n")
                resolver.fulfill("干净的碗筷")
            }
        }
        return p
    }
    
    
    
    // 切菜
    func cutUp() -> Promise<String> {
        let p = Promise<String> { resolver in
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                print("切菜完毕！")
                resolver.fulfill("切好的菜")
            }
        }
        return p
    }
    
    // 烧水
    func boil() -> Promise<String> {
        let p = Promise<String> { resolver in
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                print("烧水完毕！")
                resolver.fulfill("烧好的水")
            }
        }
        return p
    }
}
