//: [Previous](@previous)

import Foundation

func mergeSort<T:Comparable>(array: [T]) -> [T] {
    guard array.count > 1 else { return array }
    let midIndex = array.count / 2

    let left = mergeSort(array: Array(array[0..<midIndex]))
    let right = mergeSort(array: Array(array[midIndex..<array.count]))

    return merge(left: left, right: right)
}

func merge<T:Comparable>(left: [T], right: [T]) -> [T] {
    var result: [T] = []

    var leftIndex = 0
    var rightIndex = 0

    while leftIndex < left.count && rightIndex < right.count {
        if left[leftIndex] < right[rightIndex] {
            result.append(left[leftIndex])
            leftIndex += 1
        } else if left[leftIndex] > right[rightIndex] {
            result.append(right[rightIndex])
            rightIndex += 1
        } else {
            result.append(left[leftIndex])
            leftIndex += 1
            result.append(right[rightIndex])
            rightIndex += 1
        }
    }

    if leftIndex < left.count {
        result.append(contentsOf: left[(leftIndex)..<left.count])
    }

    if rightIndex < right.count {
        result.append(contentsOf: right[(rightIndex)..<right.count])
    }
    return result
}

let array = [1,6,2,3,6,8,5,8]
mergeSort(array: array)
