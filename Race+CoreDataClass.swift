//
//  Race+CoreDataClass.swift
//  Rate Watch
//
//  Created by Dave Hedden on 2/5/21.
//
//

import Foundation
import CoreData

@objc(Race)
public class Race: NSManagedObject {
    func fastestAndAverageLap() -> (String, String, String) {
        // Create an array of laps, sorted by lap number
        let laps = self.laps!.sorted(by: { $0.lapNum < $1.lapNum})
        
        // Create an array of lap times
        let lapTimes = laps.map { $0.lapTime }
        
        // Find the fastest lap and its index, add 1 to correspond to correct lap number
        let fastestLap = lapTimes.min()!
        let fastestLapIndex = lapTimes.lastIndex(of: fastestLap)! + 1
        
        // Convert to string values for display
        let fastestLapString = fastestLap.formattedLapDisplay()
        let fastestLapIndexString = String(fastestLapIndex)
        
        // Get the avergage lap time
        let cumTime = laps.last!.cumTime
        let averageLap = (cumTime / TimeInterval(laps.count))
        let averageLapString = averageLap.formattedLapDisplay()
        
        return (fastestLapString, fastestLapIndexString, averageLapString)
    }
    
    func fastestAndAverageAltLap() -> (String, String, String) {
        // Create an array of laps, sorted by lap number
        let laps = self.laps!.sorted(by: { $0.lapNum < $1.lapNum})
        
        // Loop through and append all non-zero Alt Lap times into an array
        var altLapTimes = [TimeInterval]()
        for lap in laps {
            if lap.lapTimeAlternate != 0 {
                altLapTimes.append(lap.lapTimeAlternate)
            }
        }
        
        // Find the fastest Alt Lap and its index, add 1 to correspond to correct lap number
        let fastestAltLap = altLapTimes.min() ?? 0
        let fastestAltLapIndex = (altLapTimes.lastIndex(of: fastestAltLap) ?? -1) + 1
        
        // Convert to string values
        let fastestAltLapString = fastestAltLap.formattedLapDisplay()
        let fastestAltLapIndexString = String(fastestAltLapIndex)
        
        // Get average Alt Lap
        var avgAltLapString = 0.0.formattedLapDisplay()
        if !altLapTimes.isEmpty {
            let altLapSum = altLapTimes.reduce(0, +)
            avgAltLapString = (altLapSum / TimeInterval(altLapTimes.count)).formattedLapDisplay()
        }
        
        return (fastestAltLapString, fastestAltLapIndexString, avgAltLapString)
    }
    
    func finalTime() -> String {
        let cumTime = self.laps!.map { $0.cumTime }.max()!
        return cumTime.formattedLapDisplay()
    }
    
}
