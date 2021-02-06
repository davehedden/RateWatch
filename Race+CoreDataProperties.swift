//
//  Race+CoreDataProperties.swift
//  Rate Watch
//
//  Created by Dave Hedden on 2/5/21.
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
    @NSManaged public var laps: Set<Lap>?
    @NSManaged public var tags: Set<Tag>?

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

// MARK: Generated accessors for tags
extension Race {

    @objc(addTagsObject:)
    @NSManaged public func addToTags(_ value: Tag)

    @objc(removeTagsObject:)
    @NSManaged public func removeFromTags(_ value: Tag)

    @objc(addTags:)
    @NSManaged public func addToTags(_ values: Set<Tag>)

    @objc(removeTags:)
    @NSManaged public func removeFromTags(_ values: Set<Tag>)

}

extension Race : Identifiable {

}
