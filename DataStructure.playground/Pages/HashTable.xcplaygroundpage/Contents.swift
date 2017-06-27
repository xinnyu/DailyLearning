//: [Previous](@previous)

import Foundation

struct HashTable<Key:Hashable, Value> {
    typealias Element = (key :Key, value: Value)
    typealias Bucket  = [Element]

    var buckets:[Bucket]

    init(size: Int) {
        assert(size > 0, "size must be great than 0")
        buckets = Array<Bucket>(repeatElement([], count: size))
    }

    private(set) var count = 0

    var isEmpty: Bool {
        return count == 0
    }

    private func indexOf(key: Key) -> Int? {

        return 0
    }

}
