//: [Previous](@previous)

import Foundation

struct Person: CustomStringConvertible{
    var name: String
    var age: UInt
    var description: String {
        return "name: \(name), age: \(age)"
    }

    var gender: String
}


let p = Person(name: "hello", age: 18, gender: "man")

let mirror = Mirror(reflecting: p)

print(mirror.children.count)
print(mirror.subjectType)

mirror.children.filter { $0.label == "name" }.map { $0.value }.forEach { print($0) }



func delete(at path: String) {
    if let childPaths = try? FileManager.default.contentsOfDirectory(atPath: path) {
        for p in childPaths {

        }
    } else {
        return
    }
}




//: [Next](@next)
