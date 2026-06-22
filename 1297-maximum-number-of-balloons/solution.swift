class Solution {
    func maxNumberOfBalloons(_ text: String) -> Int {
        var map = [Character: Int]()

        text.forEach {
            map[$0, default: 0] += 1
        }

        // How many complete “balloon”s can I build?
        //b=1,a-1,n-1,l-2,o-2 so num of characters/actual needed
        // ans = min(2,2,2,2,2) = 2
            let instances = min(
                map["b", default: 0],
                map["a", default: 0],
                map["l", default: 0]/2,
                map["o", default: 0]/2,
                map["n", default: 0]
            )
        
        return instances
    }
}
