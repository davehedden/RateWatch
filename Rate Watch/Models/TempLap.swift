//
//  TempLap.swift
//  Rate Watch
//
//  Created by Dave Hedden on 2/1/21.
//

import Foundation

struct TempLap {
    var id: Double?
    var raceID: Double?
    var lapNum: Int = 0
    var cumTime: TimeInterval = 0
    var lapTime: TimeInterval = 0
    var lapTimeAlternate: TimeInterval = 0
    var strokeCount: Double = 0
    var strokeRates: [TimeInterval] = []
    var rateUnits: String
    
    func medianStrokeRate() -> TimeInterval {
        if self.strokeRates.count > 0 {
            let sorted = self.strokeRates.sorted()
            if sorted.count % 2 == 0 {
                return (sorted[(sorted.count / 2)] + sorted[(sorted.count / 2) - 1]) / 2
            } else {
                return sorted[(sorted.count - 1) / 2]
            }
        } else {
            return 0.00
        }
    }
}
