import Foundation

func longestBinaryGap(_ N: Int) -> Int {
    let binaryRepr = String(N, radix: 2)
    
    let bitPositions = binaryRepr.enumerated()
        .filter {$0.element == "1" }
        .map { $0.offset }
    
    let longestGap = zip(bitPositions, bitPositions.dropFirst())
        .map { $1 - $0 - 1 }
        .max() ?? 0
    
    return longestGap
}

func longestBinaryGap_Fast(_ N: Int) -> Int {
    if N <= 0 {
        return 0
    }
    
    var n = N
    while n % 2 == 0 {
        n /= 2
    }
    
    var longestGap = 0
    var gap = 0
    
    repeat {
        n /= 2
        if n % 2 == 0 {
            // Current bit is 0
            gap += 1
        } else {
            // Current bit is 1
            if gap > longestGap {
                longestGap = gap
            }
            
            gap = 0
        }
    } while n > 0
    
    return longestGap
}

func longestBinaryGap_Fastest(_ N : Int) -> Int {
    var n = N
    let firstPosition = ffsl(n)
    
    if firstPosition == 0 {
        return 0
    }
    
    n = n >> firstPosition
    
    var longestGap = 0
    
    while n > 0 {
        let position = Int(ffsl(n))
        
        if position - 1 > longestGap {
            longestGap = position - 1
        }
        
        n = n >> position
    }
    
    return longestGap
}

print(longestBinaryGap(51712))
print(longestBinaryGap_Fast(51712))
print(longestBinaryGap_Fastest(51712))
