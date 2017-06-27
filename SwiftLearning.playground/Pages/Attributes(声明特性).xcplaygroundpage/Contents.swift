//: [Previous](@previous)

import Foundation

/*:
 Swift 中的 API 可用性声明:
 @available 后面接 (参数列表)
 
 - unavailable 表示该声明在指定的平台是无效的
 - introduced 表示该声明是从指定平台版本开始引入的; 格式 introduced: 版本号
 - deprecated 表示该声明从指定平台指定版本之后被弃用;
 - obsoleted 表示该声明从指定平台指定版本之后被废弃;
 - message 提供文本信息;
 - rename 重命名信息;

    //表示该声明在 iOS 7.0 之后被弃用, iOS 8.0 之后被废弃, 不能再使用, 同时设置了废弃的信息和重新命名之后的声明;
    @available (iOS, deprecated: 7.0, obsoleted: 8.0 message: "message", renamed: "string")

    //可以这样快速设置这个声明只在 iOS 7.0, macOS 10.12 之后可用;
    @available (iOS 7.0, macOS 10.12 *)
    
    // 表示这个声明在 macOS 上是不可用的
    @available (macOS, unavailable)
 
    // 表示这个声明是在 iOS 8.0 之后引入的
    @available (iOS, introduced: 8.0)
 
 [官方文档](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Attributes.html#//apple_ref/doc/uid/TP40014097-CH35-ID347)
 */

class A {

    @available (iOS, introduced: 8.0)
    func printStr() {
        print(str)
    }

    @available (iOS, deprecated: 7.0, obsoleted:8.0, message: "message", renamed: "printStr()")
    func printString() {
        if #available(iOS 8, *) {
            return
        }
        print(string)
    }

    var str = "Hello World"
    var string = "Hello World"
}


/*:
 @discardableResult 可以忽略编译器的返回值没有使用警告
 */

@discardableResult
func getStr() -> String {
    return "Hello world"
}

/*:
 @objc
 该特性用于修饰任何可以在 Objective-C 中表示的声明。
 标有 objc 特性的类必须继承自 Objective-C 中定义的类。如果你将 objc 特性应用于一个类或协议，它也会隐式地应用于类或协议中兼容 Objective-C 的成员。对于标记了 objc 特性的类，编译器会隐式地为它的子类添加 objc 特性。标记了 objc 特性的协议不能继承没有标记 objc 的协议。
 > 注意: @objc 并不代表是动态派发, 要确定动态派发, 需要加上 dynamic 关键字;
 @noobjc 与之相反
 */

@objc
class B:NSObject {
    dynamic var a = Date()
}

/*:
 @IBDesignable 和 @IBInspectable
 分别用来修饰类和类的属性, 表示可以在 storyboard 中设置 UI

 @IBAction 和 @IBOutlet 特性都意味着@objc特性。
 */

/*
 @testable
 在单元测试中 import 模块时用 @testable 修饰可以访问 internal 属性和方法
 */

//: [Next](@next)
