//: Playground - noun: a place where people can play

import UIKit

func maxHeapify<T: Comparable>(a: inout [T], index: Int, endIndex: Int) {
    var parentIndex = index

    while true {
        var childIndex = parentIndex * 2 + 1

        if endIndex < childIndex {
            break
        }

        if childIndex + 1 <= endIndex && a[childIndex + 1] > a[childIndex] {
            childIndex += 1
        }

        if a[childIndex] > a[parentIndex] {
            swap(&a[parentIndex], &a[childIndex])
            parentIndex = childIndex
        } else {
            break
        }
    }
}

func creatMaxHeap<T:Comparable>(array: inout [T]) {
    if array.count < 2 {
        return
    }
    let maxLeafIndex = (array.count) / 2 - 1
    for i in (0...maxLeafIndex).reversed() {
        maxHeapify(a: &array, index: i, endIndex: array.count - 1)
    }
}


/// 堆排序
func heapSort(array: inout [Int]){
    creatMaxHeap(array: &array)
    for i in (0...array.count - 1).reversed(){
        if i != 0{
            swap(&array[0], &array[i])
        }
        maxHeapify(a: &array, index: 0, endIndex: i - 1)
    }
}
var array = [1,2,3,4,5,6]

creatMaxHeap(array: &array)

heapSort(array: &array)