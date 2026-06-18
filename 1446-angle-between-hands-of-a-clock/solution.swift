class Solution {
    func angleClock(_ hour: Int, _ minutes: Int) -> Double {
        // Hour hand moves 30° for every hour.
        // (360° / 12 hours = 30°)
        let hourHand = 30 // 360/12
        // Hour hand also moves gradually as minutes pass.
        // In 1 hour (60 mins) it moves 30°,
        // so in 1 minute it moves 30/60 = 0.5°
        let perMin = 0.5 // 30/60 

        // Minute hand moves 6° every minute.
        // (360° / 60 mins = 6°)
        let minHand = 6 // 360/60

        // Position of hour hand:
        //
        // Example: 3:30
        // Hour hand is not exactly at 3.
        // It has already moved halfway towards 4.
        //
        // 3 * 30 = 90°
        // 30 * 0.5 = 15°
        //
        // Total = 105°
        // hour % 12 => Because a clock has only 12 positions, not 24.
        let hourAngle = Double(hour % 12) * 30 + Double(minutes) * 0.5
        // Position of minute hand.
        //
        // Example: 30 mins
        //
        // 30 * 6 = 180°
        let minuteAngle = Double(minutes) * 6

        // Absolute difference between the two hand positions.
        //
        // Example:
        // hourAngle = 105°
        // minuteAngle = 180°
        //
        // diff = 75°

        let diff = abs(hourAngle - minuteAngle)
        // There are always two angles between clock hands.
        //
        // Example:
        // One side = 75°
        // Other side = 360 - 75 = 285°
        //
        // We need the smaller angle.
        return min(diff, 360 - diff)
    }
}
