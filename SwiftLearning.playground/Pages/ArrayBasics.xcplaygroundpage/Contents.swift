//: [Previous](@previous)

import Foundation

var array = [Int]()

array += [1, 2, 3, 4]



array.forEach { print($0) }

array.popLast()

array.first

array.last

array.filter { return $0 > 2 }

//print( array1.index(where: { $0 > 2 }) )

print(array.map { return String($0) })


for (index, value) in array.enumerated() {
    print("\(index) : \(value)")
}


/// swift 中的 flatMap 方法有两种实现, 一种是用来过滤掉操作数组之后可能产生的 nil 值, 这种实现传的 transform 是 (Element) -> T?

/// 另一种是用于数组的降维, 这种实现传的 transform 是 (Element) -> [T]

var array2 = ["1", "2", "A"]

let arr = array2.flatMap { a -> Int? in
    return Int(a)
}

arr

var array3 = [[1, 2, 4], [5, 6, 7]]


let arr1 = array3.flatMap { $0 }

arr1.map({ $0 })

let urlStr = "https://raw.githubusercontent.com/xiaomuxue/XML/master/7月25号/xsl.xml".addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!



print(urlStr)






