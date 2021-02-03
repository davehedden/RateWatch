//
//  Lap+CoreDataProperties.swift
//  Rate Watch
//
//  Created by Dave Hedden on 2/2/21.
//
//

import Foundation
import CoreData


extension Lap {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Lap> {
        return NSFetchRequest<Lap>(entityName: "Lap")
    }

    @NSManaged public var cumTime: Double
    @NSManaged public var id: Double
    @NSManaged public var lapTime: Double
    @NSManaged public var lapTimeAlternate: Double
    @NSManaged public var raceID: Double
    @NSManaged public var rateUnits: String?
    @NSManaged public var storedLapNum: Int64
    @NSManaged public var storedStrokeCount: Int64
    @NSManaged public var strokeRates: [Double]?
    @NSManaged public var race: Race?

}

extension Lap : Identifiable {

}
