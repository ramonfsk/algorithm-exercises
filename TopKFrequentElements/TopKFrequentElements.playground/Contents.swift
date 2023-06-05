import Foundation

func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    var dict: [Int: Int] = [:]
    
    Set<Int>(nums).forEach { index in
        dict[index] = 0
    }
    
    nums.forEach { number in
        if (dict.index(forKey: number) != nil) {
            dict[number]! += 1
        }
    }
    
    let dictSortedByValues = dict.sorted { $0.value > $1.value }
    
    var mostFrequentelements: [Int] = []
    
    var index = 0
    
    for (key, _) in dictSortedByValues {
        if mostFrequentelements.count == k {
            return mostFrequentelements.sorted()
        } else if index < k {
            mostFrequentelements.append(key)
            index += 1
        }
    }
    
    return mostFrequentelements.sorted()
}

func topKFrequent_best(_ nums: [Int], _ k: Int) -> [Int] {
    let freqencies = Dictionary(nums.map { ($0, 1) }, uniquingKeysWith: +)
    
    return Array(freqencies.keys.sorted { freqencies[$0]! > freqencies[$1]! }[0..<k]).sorted()
}

print(topKFrequent([1,1,1,2,2,2,3,3,3], 3))
print(topKFrequent_best([1,1,1,2,2,2,3,3,3], 3))
