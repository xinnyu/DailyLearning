//: [Previous](@previous)

import Foundation

var count = 1

var timer = Timer(timeInterval: 1, repeats: true) { timer in
    count += 1
    print("hello")
    if count > 3 {
        timer.invalidate()
        print(timer)
    }
}

RunLoop.current.add(timer, forMode: .commonModes)

// 在 storyboard 中因为主线程的 RunLoop 不是默认一直开启的, 所以需要手动调用 run 方法
RunLoop.main.run(until: Date(timeIntervalSinceNow: 300))

//: [Next](@next)
