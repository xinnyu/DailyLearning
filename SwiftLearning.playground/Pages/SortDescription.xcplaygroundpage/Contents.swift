//: [Previous](@previous)

import Foundation

/*:
 ### 在 swift 中使用 OC 的 SortDesciptor 特性
 在 OC 中对数组排序时我们可以使用 NSSortDescriptor, 虽然在 Swift 中也可以使用, 但是他有一定的局限性, 比如只支持继承类类型, 而且是继承自 NSObject 的类类型,
 而且使用起来是这样的: 
 
     // 首先定义一个 nameDescriptor
     let nameDescriptor = NSSortDescriptor(key: #keyPath(Person.name), ascending: true, selector: #selector(NSString.localizedCompare(_:)))
     // 然后定义一个数组
     let descriptors = [nameDescriptor]
     // 然后把 array 转换成 NSArray, 调用方法
     let sortedPersons = (persons as NSArray).sortedArray(using: descriptors)

 由于这个操作涉及到了很多的 OC runningtime 的方法, 比如 kvc selector, 所以在 Swift 中使用才如此蹩脚, 但是我们可以自己实现一个 SortDescriptor; 让 SortDescriptor 
 使用更加方便而且支持 struct 类型
 */


//:定义一个 typealias 来表示排序函数
typealias SortDescriptor<T> = (T, T) -> Bool


/*:
 定义一个创建 SortDescriptor 的工厂函数
 这里我们使用@escaping修饰了用于获取Value以及排序的函数参数，这是因为在我们返回的函数里，使用了key以及isAscending，这两个函数都逃离了makeDescriptor作用域，而Swift 3里，
 作为参数的函数类型默认是不能逃离的，因此我们需要明确告知编译器这种情况。
 */
func makeSortDescriptor<Key, Value>(key: @escaping (Key) -> Value, _ isAscending: @escaping (Value, Value) -> Bool) -> SortDescriptor<Key> {
    return { isAscending(key($0), key($1)) }
}

/// 测试用
struct Person: CustomStringConvertible {
    var name: String
    var age: Int
    var gender: String

    var description: String {
        return "\(name) \t \(age) \t \(gender)"
    }
}

var persons = [Person(name: "zhangsan", age: 10, gender: "man"),
               Person(name: "lisi", age: 20, gender: "man"),
               Person(name: "wangwu", age: 21, gender: "women"),
               Person(name: "zhangsan", age: 50, gender: "women"),
               Person(name: "hello", age: 24, gender: "man"),
               Person(name: "zhangsan", age: 30, gender: "women"),
               Person(name: "zhangsan", age: 70, gender: "women"),
               Person(name: "zhangsan", age: 60, gender: "women")]

/*:
 创建一个 nameDescriptor, 用来排序 name 属性
 */

let nameDescriptor: SortDescriptor<Person> = makeSortDescriptor(key: { $0.name }, {$0.localizedCompare($1) == .orderedAscending})

let sortedPersons = persons.sorted(by: nameDescriptor)

//print(sortedPersons)

/*
 但是我们还没有实现多个 SortDescriptor 的功能, 首先为 Array 创建一个 extension;
 这里我们使用一个 combine 方法来实现把几个 SortDescriptor 合并成一个的功能:
 
 这里有三个要点:
 - 如果某一个 SortDescriptor 可以比较出大小, 后面的 SortDescriptor 就跳过对比;
 - 前一个 SortDescriptor 比较出的结果相等时, 才调用下一个 SortDescriptor 进行对比;
 - 如果所有的 SortDescriptor 比较的结果都相等时, 返回 false, 不处理位置;
 
 combine 函数中, 使用了一个技巧: 当 rule(l, r) 和 rule(r, l) 都为 false 时, 即为相等的情况

 */


extension Array {

    mutating func sort(by descriptors: [(Element, Element) -> Bool]) {
        func combine(rules: [(Element, Element) -> Bool]) -> (Element, Element) -> Bool {
            return { l, r in
                for rule in rules {
                    if rule(l, r) {
                        return true
                    }
                    if rule(r, l) {
                        return false
                    }
                }
                return false
            }
        }

        let mixDescriptor = combine(rules: descriptors)
        sort(by: mixDescriptor)
    }
}


let ageDescriptor: SortDescriptor<Person> = makeSortDescriptor(key: { $0.age }, <)

persons.sort(by: [nameDescriptor, ageDescriptor])

print(persons)

//: [Next](@next)






