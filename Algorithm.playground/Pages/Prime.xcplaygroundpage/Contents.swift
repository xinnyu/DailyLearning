//: [Previous](@previous)

import Foundation

func isPrime(n: Int) -> Bool {
    guard n > 1 else { return false }
    if n == 2 { return true }

    // 大于2的偶数一定是合数
    if n % 2 == 0 { return false }

    let flag = Int(sqrt(Double(n))) + 1

    var i: Int = 3

    while i <= flag {
        if n % i == 0 {
            return false
        }
        // 这里也只要除奇数不用除偶数,
        i += 2
        print(i)
    }

    return true
}

//for i:Int in 3...1000 {
//    if isPrime(n: i) {
//        print(i)
//    }
//}

isPrime(n: 8988989897333333)
