class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var n = numbers.count
        var i=0
        var j=n-1

        while i <= j {
            if numbers[i] + numbers[j] == target {
                return [i+1,j+1]
            } else if numbers[i] + numbers[j] < target {
                i += 1
            } else {
                j -= 1
            }
        }
        return [-1,-1]
    }
}
