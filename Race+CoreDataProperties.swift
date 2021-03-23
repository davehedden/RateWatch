//
//  Race+CoreDataProperties.swift
//  Rate Watch
//
//  Created by Dave Hedden on 3/23/21.
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
    @NSManaged public var title: String?
    @NSManaged public var laps: Set<Lap>?
    
    public var defaultTitle: String {
        "\(dateFormatter.string(from: timestamp!)) \(datetimeFormatter.string(from: timestamp!)) \(self.finalTime())"
    }

}

// MARK: Generated accessors for laps
extension Race {

    @objc(addLapsObject:)
    @NSManaged public func addToLaps(_ value: Lap)

    @objc(removeLapsObject:)
    @NSManaged public func removeFromLaps(_ value: Lap)

    @objc(addLaps:)
    @NSManaged public func addToLaps(_ values: Set<Lap>)

    @objc(removeLaps:)
    @NSManaged public func removeFromLaps(_ values: Set<Lap>)

}

extension Race : Identifiable {

}
