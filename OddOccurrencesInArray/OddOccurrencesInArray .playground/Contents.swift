import Foundation

extension String {
    static func binaryRepresentation<F: FixedWidthInteger>(of val: F) -> String {

        let binaryString = String(val, radix: 2)

        if val.leadingZeroBitCount > 0 {
            return String(repeating: "0", count: val.leadingZeroBitCount) + binaryString
        }

        return binaryString
    }
}

func solution(_ array : inout [Int]) -> Int {
    if array.isEmpty || array.count > 1000000000 {
        return -1
    }
    
    var result = 0
    
    array.forEach { number in
        result = result ^ number
    }
    
    return result
}

var array = [9, 3, 9, 3, 9, 7, 9]

print(solution(&array))

print("\(String.binaryRepresentation(of: UInt8(14 ^ 9))) = \(String.binaryRepresentation(of: UInt8(14))) ^ \(String.binaryRepresentation(of: UInt8(9)))")

