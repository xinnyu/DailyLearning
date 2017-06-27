//: [Previous](@previous)

import Foundation

func binarySearch<T:Comparable>(_ array: [T], target: T) -> Bool {
    var low = 0
    var high = array.count - 1

    while low <= high {
        var mid = (high - low) / 2 + low
        print(mid)
        if array[mid] == target {
            return true
        } else if array[mid] > target {
            high = mid - 1
        } else if array[mid] < target {
            low = mid + 1
        }
    }

    return false
}

let array:[Int] = [2,4,6,8,9]

binarySearch(array, target: 2)

func recursiveBinarySearch<T: Comparable>(_ array: [T], low: Int, high: Int, target: T) -> Bool {
    if high < low {
        return false
    }

    var mid = (high - low) / 2 + low
    if array[mid] == target {
        return true
    } else if array[mid] > target {
        return recursiveBinarySearch(array, low: low, high: mid - 1, target: target)
    } else  {
        return recursiveBinarySearch(array, low: mid + 1, high: high, target: target)
    }
}


recursiveBinarySearch(array, low: 0, high: array.count - 1, target: 90)