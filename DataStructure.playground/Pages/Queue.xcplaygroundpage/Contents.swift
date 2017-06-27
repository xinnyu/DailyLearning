//: [Previous](@previous)

import Foundation

struct Queue<T> {
    private var items = [T]()

    /// 入队
    mutating func dequeue() {
        items.removeFirst()
    }

    /// 出队
    mutating func enqueue(value: T) {
        items.append(value)
    }

    var count: Int {
        return items.count
    }
}
