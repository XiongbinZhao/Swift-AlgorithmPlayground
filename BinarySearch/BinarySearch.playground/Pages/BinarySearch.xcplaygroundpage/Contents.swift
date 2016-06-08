//: Playground - noun: a place where people can play

import Foundation

//My Implementation
func insertionSort(array:[Int]) -> [Int] {
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

func binarySearch(array:[Int], target:Int) -> Int? {
    var next = [Int]()
    let length = array.count
    let leftCount = length/2 - 1
    if target <= array[leftCount] {
        next = Array(array[0...leftCount])
    } else {
        next = Array(array[leftCount+1...length-1])
    }
    
    if next.count != 1 {
        return binarySearch(next, target: target)
    } else {
        return next[0] == target ? next[0] : nil
    }
}

//Sample Implementation
func sampleBinarySearch<T: Comparable>(a:[T], key:T, range:Range<Int>) -> Int? {
    if range.startIndex >= range.endIndex {
        return nil
    } else {
        let midIndex = range.startIndex + (range.endIndex - range.startIndex) / 2
        
        if a[midIndex] > key {
            return sampleBinarySearch(a, key: key, range: range.startIndex..<midIndex)
        } else if a[midIndex] < key {
            return sampleBinarySearch(a, key: key, range: midIndex+1..<range.endIndex)
        } else {
            return midIndex
        }
    }
}


let arrayToSearch = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]

let sortedArray = insertionSort(arrayToSearch)

let final = sampleBinarySearch(sortedArray, key: 43, range: 0..<sortedArray.count)





