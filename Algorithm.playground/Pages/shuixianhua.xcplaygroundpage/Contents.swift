//: [Previous](@previous)

import Foundation


var a = 123

func divideNum(_ a: Int) -> [Int] {
    var a = a
    var result = [Int]()
    while a % 10 != a {
        let b = a % 10
        result.append(b)
        a = a / 10
    }
    result.append(a)
    return result
}


func isArmstrongNum(n: Int) -> Bool {
    let array = divideNum(n)
    let count = array.count
    return (array.reduce(0) {
        $0 + pow(Double($1), Double(array.count))
    }) == Double(n)
}

isArmstrongNum(n: 154)

for i in 100...10000 {
    if isArmstrongNum(n: i) {
        print(i)
    }
}

//: [Next](@next)
