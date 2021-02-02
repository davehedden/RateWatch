//
//  TimeIntervalExtension.swift
//  Rate Watch
//
//  Created by Dave Hedden on 1/21/21.
//

import Foundation

extension TimeInterval {
    func formattedTimerDisplay() -> String {
        var hundredths = Int((self.truncatingRemainder(dividingBy: 1) * 100).rounded())
        
        if hundredths == 100 {
            hundredths -= 1
        }

        return timerDisplayFormatter.string(from: self)! + "." + String(format: "%02d", hundredths)
    }
    
    func formattedLapDisplay() -> String {
        var hundredths = Int((self.truncatingRemainder(dividingBy: 1) * 100).rounded())
        
        if hundredths == 100 {
            hundredths -= 1
        }
        
        return lapTimeFormatter.string(from: self)! + "." + String(format: "%02d", hundredths)
    }
    
    func formattedRateDisplay(units: String) -> String {
        
        switch units {
        case K.RateUnits.cyclesPerMinute:
            return String(format: "%.1f", self)
        default:
            var hundredths = Int((self.truncatingRemainder(dividingBy: 1) * 100).rounded())
            
            if hundredths == 100 {
                hundredths -= 1
            }
            return lapTimeFormatter.string(from: self)! + "." + String(format: "%02d", hundredths)
        }
    }
    
    func truncate(toPlaces: Int) -> TimeInterval {
        /// This function truncates a TimeInterval value to the hundredths value (e.g. 34.9185173 becomes 34.91)
        
        let decimalNum = pow(10.0, Double(toPlaces))
        return (self * decimalNum).rounded(.towardZero) / decimalNum
    }
    
    func round(toPlaces: Int) -> TimeInterval {
        /// This function truncates a TimeInterval value to the hundredths value (e.g. 34.9185173 becomes 34.91)

        let decimalNum = pow(10.0, Double(toPlaces))
        return (self * decimalNum).rounded(.toNearestOrAwayFromZero) / decimalNum
    }
}
