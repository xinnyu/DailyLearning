//: [Previous](@previous)

import Foundation

// JSON 文件
var str = "{ \"string\" : { \"a\" : 1 } }"
let data = str.data(using: .utf8)!
let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableLeaves)


// plist 文件
if let fileUrl = Bundle.main.url(forResource: "fileName", withExtension: "plist"),
    let data = try? Data(contentsOf: fileUrl) {
    if let result = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [[String: Any]] { // [String: Any] which ever it is
        print(result as Any)
    }
}

//: [Next](@next)
