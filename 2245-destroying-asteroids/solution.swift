class Solution {
    func asteroidsDestroyed(_ mass: Int, _ asteroids: [Int]) -> Bool {
        var asteroids = asteroids
        asteroids.sort()
        var ans = mass

        for asteroid in asteroids {
            if ans >= asteroid {
                ans += asteroid
            } else {
                return false
            }
        }
        return true
    }
}
