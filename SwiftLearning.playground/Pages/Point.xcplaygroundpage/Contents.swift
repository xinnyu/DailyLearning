//: [Previous](@previous)

import Foundation

var point = UnsafeMutablePointer<String>.allocate(capacity: MemoryLayout<String>.size)

point.initialize(to: "hello world")

print(point.pointee)

free(point)

print(MemoryLayout<String>.size)

//: [Next](@next)
