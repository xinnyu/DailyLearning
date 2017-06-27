//: [Previous](@previous)

import Foundation

var stringOnes = ["1", "one"]

let intOnes = stringOnes.map { Int($0) }

intOnes.forEach { print($0) }

// swift 中的 for 循环本质上是根据 while 循环来实现的, 和下面的代码等价:

var i = intOnes.makeIterator()

while let i = i.next() {
    print(i)
}

// 在上面代码中 intOnes 的类型是一个[Int?], 所以在while 循环中的 i 其实是一个 Optional<Int?>, 那么循环中的第二 i 就应该是一个 Optional<nil>, 但是控制台输出的是 nil, 所以 Swift 在双重Optional 的处理中是有优化的,


for case let one? in intOnes {
    print(one)
}


//: [Next](@next)
