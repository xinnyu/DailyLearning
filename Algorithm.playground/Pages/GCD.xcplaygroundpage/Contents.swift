//: [Previous](@previous)

import Foundation

// 用于求最大公约数
func gcd(x: Int, y: Int) -> Int {
    var t = min(x, y)

    while x % t != 0 || y % t != 0 {
        t = t - 1
    }

    return t
}

gcd(x: 25, y: 45)