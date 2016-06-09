//: Playground - noun: a place where people can play

import Foundation

func mergeSortBottomUp<T>(a: [T], _ isOrderedBefore:(T,T) -> Bool) -> [T] {
    let n = a.count
    
    var z = [a,a]
    var d = 0
    
    var width = 1
    while width < n {
        
        var i = 0
        while i < n {
            var j = i
            var l = i
            var r = i + width
            
            let lmax = min(l + width, n)
            let rmax = min(r + width, n)
            
            while l < lmax && r < rmax {
                if isOrderedBefore(z[d][l], z[d][r]) {
                    z[1-d][j] = z[d][l]
                    l += 1
                } else {
                    z[1-d][j] = z[d][r]
                    r += 1
                }
                
                j += 1
            }
            
            while l < lmax {
                z[1-d][j] = z[d][l]
                j += 1
                l += 1
            }
            
            while r < rmax {
                z[1-d][j] = z[d][r]
                j += 1
                r += 1
            }
            
            i += width*2
        }
        
        width *= 2
        d = 1 - d
    }
    return z[d]
}

//MARK: Top-down Merge Sort
func sampleMergeSort(array:[Int]) -> [Int] {
    guard array.count > 1 else {return array}
    
    let middleIndex = array.count/2
    let leftArray = sampleMergeSort(Array(array[0..<middleIndex]))
    let rightArray = sampleMergeSort(Array(array[middleIndex..<array.count]))
    return merge(leftArray, rightPile: rightArray)
}

func merge(leftPile:[Int], rightPile:[Int]) -> [Int] {
    var leftIndex = 0
    var rightIndex = 0
    
    var orderedPile = [Int]()
    
    while leftIndex < leftPile.count && rightIndex < rightPile.count {
        if leftPile[leftIndex] < rightPile[rightIndex] {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
        } else if leftPile[leftIndex] > rightPile[rightIndex] {
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        } else {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
    }
    
    while leftIndex < leftPile.count {
        orderedPile.append(leftPile[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < rightPile.count {
        orderedPile.append(rightPile[rightIndex])
        rightIndex += 1
    }
    
    return orderedPile
}

let arrayToSort = [2,3,4,1,2,33,42,123,53,21,42,3,242,23,2]

sampleMergeSort(arrayToSort)
mergeSortBottomUp(arrayToSort, <)
