//: [Previous](@previous)

import Foundation


// “抛出方法不能重写非抛出方法，而且抛出方法不能满足协议对于非抛出方法的要求。也就是说，非抛出方法可以重写抛出方法，而且非抛出方法可以满足协议对于抛出方法的要求。”

protocol MyProtocol {
    func myFunction() throws -> String
}

class A: MyProtocol {
    var a = 10
    func myFunction() -> String {
        if #available(iOS 9.0, *) {
            return "hello world"
        }

        return "Hello world"
    }

    func myFunction2() throws -> String {
        return ""
    }
}


class B: A {
    override func myFunction2() -> String {
        return ""
    }
}

A().myFunction()

//: [Next](@next)
