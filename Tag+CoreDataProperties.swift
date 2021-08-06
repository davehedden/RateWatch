//
//  Tag+CoreDataProperties.swift
//  Rate Watch
//
//  Created by Dave Hedden on 4/30/21.
//
//

import Foundation
import CoreData


extension Tag {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tag> {
        return NSFetchRequest<Tag>(entityName: "Tag")
    }

    @NSManaged public var title: String?
    @NSManaged public var id: UUID?
    @NSManaged public var race: Set<Race>?

}

// MARK: Generated accessors for race
extension Tag {

    @objc(addRaceObject:)
    @NSManaged public func addToRace(_ value: Race)

    @objc(removeRaceObject:)
    @NSManaged public func removeFromRace(_ value: Race)

    @objc(addRace:)
    @NSManaged public func addToRace(_ values: Set<Race>)

    @objc(removeRace:)
    @NSManaged public func removeFromRace(_ values: Set<Race>)

}

extension Tag : Identifiable {

}
