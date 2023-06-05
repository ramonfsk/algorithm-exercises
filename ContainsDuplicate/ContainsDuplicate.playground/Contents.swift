import Foundation

func containsDuplicate(_ nums: [Int]) -> Bool {
    if nums.isEmpty || nums.count <= 1 {
        return false
    }
    
    var sortedNumbers = nums.sorted()
    
    var previousItem = sortedNumbers[0]
    
    for index in 1..<sortedNumbers.count {
        if previousItem == sortedNumbers[index] {
            return true
        }
        
        previousItem = sortedNumbers[index]
    }
    
    return false
}

func containsDuplicate_moreEasy(_ nums: [Int]) -> Bool {
    // Using HashMap you ensure that new array dont have duplicates
    return nums.count > Set<Int>(nums).count
}

var arrayNumbers = [1,2,3,1]

print(containsDuplicate(arrayNumbers))
print(containsDuplicate_moreEasy(arrayNumbers))
