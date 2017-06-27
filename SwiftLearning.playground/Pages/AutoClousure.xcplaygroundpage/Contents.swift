//: [Previous](@previous)

import Foundation


var array:[Int] = []

if !array.isEmpty && array[0] == 1 {
    print(array)
}

/*: 
在 swift 中逻辑与操作符会先判断第一表达式, 如果第一个表达式为 false 时, 就不会再判断第二个表达式了, 这是一个很常见的用法,
但是如果是你自己定义的逻辑与操作函数就不会有上面的特性了, 所以下面的代码是会 crash 的:
 
    func logicAnd(l: Bool, r: Bool) -> Bool {
         guard l else { return false }
         return r
    }

    logicAnd(l: !array.isEmpty, r: array[1] == 0)

这是因为在 swift 中, 在函数执行前编译器需要先评估函数的所有参数, 在评估到右边表达式时, 就会产生数组越界, 所以我们的 guard 也
完全不会起作用;

这个问题很容易解决, 我们只需要把第二个参数获取 bool 值的过程封装在一个函数中:

    func logicAnd(l:Bool, r:() -> Bool) -> Bool {
        guard l else { return false }
        return r()
    }

但是这样也有一个问题, 每次传参数的时候我们都需要把表达式写在一个 closure 中, 很不方便;
这时我们的 autoclosure 就派上用场了:

它会自动把传入参数的表达式转换成闭包, 然后我们就不用再在每次传参时写一个 closure 了;
 */

func logicAnd(l:Bool, r: @autoclosure () -> Bool) -> Bool {
    guard l else { return false }
    return r()
}

logicAnd(l: !array.isEmpty, r:  array[1] == 0 )







