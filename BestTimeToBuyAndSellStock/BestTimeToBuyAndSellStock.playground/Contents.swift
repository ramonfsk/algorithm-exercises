import Foundation

func maxProfit(_ prices: [Int]) -> Int {
    var result = 0
    var minimum = prices[0]
    
    for value in prices {
        // max value
        result = max(result, value - minimum)
        // minimum value
        minimum = min(minimum, value)
    }
    
    return result
}

print(maxProfit([7,1,5,3,6,4]))
