//: [Previous](@previous)

import Foundation

/*
 我们首先看下面的例子, 虽然 Array 在 Swift 中是一个 struct, 但我们通过 MemoryLayout.size 方法来查看array 的内存大小时, 无论 array 中元素的个数是多少, 我们都得到的是8, 也就是一个64位内存地址占用的空间; 也就是说array 中的数字并没有保存在 array 的对象里, 它们会储存在系统的堆内存中;
 */

var array = [1, 3, 4, 6]
var array1 = [1, 4, 6, 8, 10, 12, 56, 78]

MemoryLayout.size(ofValue: array)
MemoryLayout.size(ofValue: array1)


/*
 当我们把 array 的值再复制给 array2 而不改变任何一个 array 的值时, 两个 array 还是指向同一个内存地址, 只有当一个的值改变了之后, 它才会获得一个新的地址;
 */

/// 定义一个查看数组内存地址的函数
func getBufferAddress<T>(array: [T]) -> String {
    return array.withUnsafeBufferPointer { return String(describing: $0) }
}

var array2 = array
MemoryLayout.size(ofValue: array2)

getBufferAddress(array: array)
getBufferAddress(array: array2)
array.append(2)
getBufferAddress(array: array)
getBufferAddress(array: array2)



//: [Next](@next)

