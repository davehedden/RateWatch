//
//  Race+CoreDataProperties.swift
//  Rate Watch
//
//  Created by Dave Hedden on 2/2/21.
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
    @NSManaged public var laps: NSOrderedSet?
    @NSManaged public var tags: NSSet?

}

// MARK: Generated accessors for laps
extension Race {

    @objc(insertObject:inLapsAtIndex:)
    @NSManaged public func insertIntoLaps(_ value: Lap, at idx: Int)

    @objc(removeObjectFromLapsAtIndex:)
    @NSManaged public func removeFromLaps(at idx: Int)

    @objc(insertLaps:atIndexes:)
    @NSManaged public func insertIntoLaps(_ values: [Lap], at indexes: NSIndexSet)

    @objc(removeLapsAtIndexes:)
    @NSManaged public func removeFromLaps(at indexes: NSIndexSet)

    @objc(replaceObjectInLapsAtIndex:withObject:)
    @NSManaged public func replaceLaps(at idx: Int, with value: Lap)

    @objc(replaceLapsAtIndexes:withLaps:)
    @NSManaged public func replaceLaps(at indexes: NSIndexSet, with values: [Lap])

    @objc(addLapsObject:)
    @NSManaged public func addToLaps(_ value: Lap)

    @objc(removeLapsObject:)
    @NSManaged public func removeFromLaps(_ value: Lap)

    @objc(addLaps:)
    @NSManaged public func addToLaps(_ values: NSOrderedSet)

    @objc(removeLaps:)
    @NSManaged public func removeFromLaps(_ values: NSOrderedSet)

}

// MARK: Generated accessors for tags
extension Race {

    @objc(addTagsObject:)
    @NSManaged public func addToTags(_ value: Tag)

    @objc(removeTagsObject:)
    @NSManaged public func removeFromTags(_ value: Tag)

    @objc(addTags:)
    @NSManaged public func addToTags(_ values: NSSet)

    @objc(removeTags:)
    @NSManaged public func removeFromTags(_ values: NSSet)

}

extension Race : Identifiable {

}
