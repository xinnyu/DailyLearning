//: [Previous](@previous)

import Foundation

/// 此版本需要额外的空间复杂度

func quickSort<T:Comparable>(a: [T]) -> [T] {
    guard a.count > 1 else {
        return a
    }
    let pivot = a[0]
    let less = a.filter { $0 < pivot }
    let greater = a.filter { $0 > pivot }
    let equal = a.filter { $0 == pivot }
    return quickSort(a: less) + equal + quickSort(a: greater)
}

var array = [2,1,4,5,7,3,4]

//print(quickSort(a: array))



/// 改良

/// Lomuto's partitioning scheme
func partitionLomuto<T: Comparable>(a: inout [T], low: Int, high: Int) -> Int {
    let pivot = a[high]

    var i = low
    for j in low..<high {
        if a[j] < pivot {
            (a[i], a[j]) = (a[j], a[i])
            i += 1
        }
    }

    (a[i], a[high]) = (a[high], a[i])
    return i
}

func quickSortLomuto<T:Comparable>(a: inout [T], low: Int, high: Int) {
    guard low < high else { return }
    let index = partitionLomuto(a: &a, low: low, high: high)

    quickSortLomuto(a: &a, low: low, high: index - 1)
    quickSortLomuto(a: &a, low: index + 1, high: high)
}


//quickSortLomuto(a: &array, low: 0, high: array.count - 1)
//print(array)

// Hoare's partitioning scheme

func partitionHoare<T:Comparable>(a: inout [T], low: Int, high: Int) -> Int {
    let pivot = a[low]

    var i = low - 1, j = high + 1

    while i < j {
        repeat { j -= 1 } while ( a[j] > pivot )
        repeat { i += 1 } while ( a[i] < pivot )

        if i < j{
            swap(&a[i], &a[j])
        } else {
            return j
        }
    }
    return j
}

func quickSortHoare<T:Comparable>(a: inout [T], low:Int, high: Int) {
    guard low < high else { return }
    let index = partitionHoare(a: &a, low: low, high: high)

    quickSortHoare(a: &a, low: low, high: index)
    quickSortHoare(a: &a, low: index + 1, high: high)
}

quickSortHoare(a: &array, low: 0, high: array.count - 1)
