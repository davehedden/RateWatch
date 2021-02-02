//
//  Lap+CoreDataClass.swift
//  Rate Watch
//
//  Created by Dave Hedden on 2/1/21.
//
//

import Foundation
import CoreData

@objc(Lap)
public class Lap: NSManagedObject {
    var lapNum: Int {
        get {
            return Int(storedLapNum)
        }
        
        set {
            storedLapNum = Int64(newValue)
        }
    }
    
    var strokeCount: Int {
        get {
            return Int(storedStrokeCount)
        }
        
        set {
            storedStrokeCount = Int64(newValue)
        }
    }
    
    
    func medianStrokeRate() -> TimeInterval {
        if let rates = strokeRates {
            if rates.count > 0 {
                let sorted = rates.sorted()
                if sorted.count % 2 == 0 {
                    return (sorted[(sorted.count / 2)] + sorted[(sorted.count / 2) - 1]) / 2
                } else {
                    return sorted[(sorted.count - 1) / 2]
                }
            } else {
                return 0.00
            }
        } else {
            return 0.00
        }
    }
}
