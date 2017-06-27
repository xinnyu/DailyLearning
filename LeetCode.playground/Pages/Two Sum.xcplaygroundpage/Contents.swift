//: Playground - noun: a place where people can play

import Foundation

/*:
 Given an array of integers, return indices of the two numbers such that they add up to a specific target.

 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 
    Given nums = [2, 7, 11, 15], target = 9,

    Because nums[0] + nums[1] = 2 + 7 = 9,
    return [0, 1].
 */



class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var result: [Int] = []
        for i in 0..<nums.count {
            let a = target - nums[i]
            for j in (i+1)..<nums.count {
                if a == nums[j] {
                    result.append(i)
                    result.append(j)
                    return result
                }
            }
        }
        return result
    }

    // 用 Hash 表保存减少时间复杂度
    func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
        var result: [Int] = []

        var dic = Dictionary<Int, Int>()
        for i in 0..<nums.count {
            let a = target - nums[i]
            if dic[a] != nil {
                result.append(dic[a]!)
                result.append(i)
                return result
            }
            dic[nums[i]] = i
        }
        return result
    }

}

let nums = [3, 2, 4, 9]

let so = Solution()
so.twoSum1(nums, 13)







