//: [Previous](@previous)

import Foundation

class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        var arr = Array<Bool>(repeatElement(false, count: nums.count + 1))

        for n in nums {
            arr[n] = true
        }

        for i in 0..<arr.count {
            if !arr[i] {
                return i
            }
        }
        return 0
    }


    /*
     可以用和来简化
     */

    func missingNumber1(_ nums: [Int]) -> Int {
        let count = nums.count + 1
        var sum = (count + 1) * count / 2

        for n in nums {
            sum -= n
        }


        return sum
    }
}


//: [Next](@next)
