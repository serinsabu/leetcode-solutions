class Solution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        var freq = Array(repeating: 0, count: 26)
        for task in tasks {
            let index = Int(task.asciiValue! - Character("A").asciiValue!)
            freq[index] += 1
        }

        let maxFreq = freq.max()!
        var maxCount = 0

        for count in freq {
            if count == maxFreq {
                maxCount += 1
            }
        }

        let slots = (maxFreq - 1) * (n + 1) + maxCount
        return max(tasks.count, slots)
    }
}
