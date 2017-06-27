//: Playground - noun: a place where people can play

import UIKit

/// Stack

struct Stact<T:Equatable> {
    var items: [T]

    /// 栈顶指针
    var top:Int {
        return items.count - 1
    }

    var isEmpty:Bool {
        return items.isEmpty
    }
    init(values: [T]) {
        items = values
    }
    /// 出栈
    mutating func pop() {
        items.removeLast()
    }
    /// 压栈
    mutating func push(value: T) {
        items.append(value)
    }
}