import Foundation

public func solution(_ array : inout [Int], _ k : Int) -> [Int] {
    var k = k
    if array.isEmpty || k == array.count || Set<Int>(array).count == 1 {
        return array
    }
    
    let min = 0
    let max = 100
    
    if array.count >= min
        && array.count <= max
        && k >= min && k <= max {
        k = array.count - (k % array.count)
        
        return Array(array[k ..< array.count] + array[0 ..< k])
    }
    
    return array
}

var array: [Int] = []

print(solution(&array, 3))
