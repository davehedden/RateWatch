//
//  Race+CoreDataProperties.swift
//  Rate Watch
//
//  Created by Dave Hedden on 2/1/21.
//
//

import Foundation
import CoreData


extension Race {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Race> {
        return NSFetchRequest<Race>(entityName: "Race")
    }

    @NSManaged public var id: Double
    @NSManaged public var timestamp: Date?
    @NSManaged public var laps: NSSet?

}

// MARK: Generated accessors for laps
extension Race {

    @objc(addLapsObject:)
    @NSManaged public func addToLaps(_ value: Lap)

    @objc(removeLapsObject:)
    @NSManaged public func removeFromLaps(_ value: Lap)

    @objc(addLaps:)
    @NSManaged public func addToLaps(_ values: NSSet)

    @objc(removeLaps:)
    @NSManaged public func removeFromLaps(_ values: NSSet)

}

extension Race : Identifiable {

}
