//: [Previous](@previous)

import Foundation

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var dic = [Int:Int]()

        for n in nums {
            if dic[n] == nil {
                dic[n] = 1
            } else {
                dic[n]! += 1
            }
        }

        for (key, value) in dic {
            if value == 1 {
                return key
            }
        }

        return 0
    }


    /*
     可以使用异或操作来简化:
     a ^ a ^ b ^ b ^ c = c
     */

    func singleNumber1(_ nums: [Int]) -> Int {
        var result = nums[0];

        for i in 1..<nums.count {
            result = result ^ nums[i]
        }

        return result
    }


}




//: [Next](@next)
