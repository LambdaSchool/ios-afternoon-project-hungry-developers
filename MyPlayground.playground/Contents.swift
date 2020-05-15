import Foundation

class Solution {
    func reverse(_ x: [Int]) -> Int {
        
        var array: [String] = []
        var stringAnswer: String = ""
        for i in x {
            array.append(String(i))
        }
        array.reverse()
        
        for i in array {
            stringAnswer.append(i)
        }
        guard let answer = Int(stringAnswer) else { return 0 }
        
        return answer
    }
    
}

Solution().reverse([10,20,30,40])
