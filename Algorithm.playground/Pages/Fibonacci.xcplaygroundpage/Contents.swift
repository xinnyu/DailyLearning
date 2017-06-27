//: [Previous](@previous)

import Foundation

func fib(n: Int) -> [Int] {
    var results: [Int] = []

    var a = 0
    var b = 1

    for i in 0...n {
        if i == 0 || i == 1 {
            results.append(i)
        } else if i > 1 {
            let result = a + b
            results.append(result)
            a = b
            b = result
        }
    }
    return results
}


print(fib(n: 20))
