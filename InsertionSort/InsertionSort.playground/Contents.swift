//: Playground - noun: a place where people can play

import UIKit

//: My Implementation
func insertionSort(array:[Int]) -> [Int] {
    var sortedArray = [Int]()
    
    for i in 0..<array.count {
        if sortedArray.count == 0 {
            sortedArray.append(array[i])
        } else {
            for j in 0..<sortedArray.count {
                if sortedArray[j] >= array[i] {
                    sortedArray.insert(array[i], atIndex: j)
                    break
                } else if j == sortedArray.count - 1 {
                    sortedArray.append(array[i])
                }
            }
        }
    }
    
    return sortedArray
}

func sampleInsertionSort(array:[Int]) -> [Int] {
    var a = array
    for x in 1..<array.count {
        var y = x
        while y>0 && a[y]<a[y-1] {
            swap(&a[y-1], &a[y])
            y-=1
        }
    }
    return a
}


let arrayToSort = [2,20,3,30,20,-9]

insertionSort(arrayToSort)

sampleInsertionSort(arrayToSort)
