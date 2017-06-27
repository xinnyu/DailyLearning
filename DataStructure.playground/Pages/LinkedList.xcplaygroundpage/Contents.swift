//: [Previous](@previous)

import Foundation

// Swift不直接支持指针，但是class是引用类型，对于实现链表、二叉树这样的基于指针的数据结构来说，也够用了。下面是链表的Swift实现：


// 节点(只能用class，struct不支持类型嵌套，也就是Node<T>内部不能声明类型为Node<T>的属性)

class Node<T:Equatable> {
    var value: T?
    var next: Node<T>!
    var prev: Node<T>!

    init(value: T?) {
        self.value = value
    }
}

class LinkedList<T:Equatable> {
    var nilNode: Node<T>!

    init() {
        nilNode = Node<T>(value: nil)
        nilNode?.next = nilNode
        nilNode?.prev = nilNode
    }

    func search(value: T) -> Node<T>? {
        var node = nilNode.next

        while let v = node?.value {
            if value != v{
                node = node?.next
            } else {
                break
            }
        }
        return node
    }

    func delete(value:T) {
        guard let node = search(value: value) else {
            print("value not found in LinkedList")
            return
        }
        node.prev.next = node.next
        node.next.prev = node.prev
    }

    func insert(value:T) -> Node<T>{
        let node          = Node<T>(value: value)
        node.next         = nilNode.next
        nilNode.next.prev = node
        nilNode.next      = node
        node.prev         = nilNode
        return node
    }
}

let list = LinkedList<Int>()
list.insert(value: 1)
list.insert(value: 2)
list.insert(value: 3)
list.insert(value: 4)
list.insert(value: 4)
list.insert(value: 3)
list.insert(value: 4)

var a = list.search(value: 1)

print(a?.value)

list.delete(value: 1)

a = list.search(value: 1)

print(a?.value)

