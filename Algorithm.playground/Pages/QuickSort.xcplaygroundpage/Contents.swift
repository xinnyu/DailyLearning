//: [Previous](@previous)

import Foundation

func partition(array: inout [Int], start: Int, end: Int) -> Int {
    guard start < end else { fatalError() }

    let pivot = array[start]

    var i = start, j = end

    while i < j {
        while i < j && pivot <= array[j] {
            j -= 1
        }
        while i < j && array[i] <= pivot {
            i += 1
        }

        if i != j{
            swap(&array[i], &array[j])
        }
    }
    if i != start {
        swap(&array[i], &array[start])
    }

    return i
}

var array = [14,23,4,12,5,5,2,7,3]

func quickSort(array: inout [Int], start: Int, end: Int) {
    guard start < end else { return }

    let index = partition(array: &array, start: start, end: end)

    quickSort(array: &array, start: start, end: index - 1)
    quickSort(array: &array, start: index + 1, end: end)
}

quickSort(array: &array, start: 0, end: array.count - 1)