import Foundation

func arraySign(_ nums: [Int]) -> Int {
    var result: Int = 1
    
    for number in nums {
        if number == 0 {
            return 0
        } else if number < 0 {
            result *= -1
        }
    }
    
    return result
}

print(arraySign([9,72,34,29,-49,-22,-77,-17,-66,-75,-44,-30,-24]))
