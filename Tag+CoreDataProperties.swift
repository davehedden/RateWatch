//
//  Tag+CoreDataProperties.swift
//  Rate Watch
//
//  Created by Dave Hedden on 2/2/21.
//
//

import Foundation
import CoreData


extension Tag {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tag> {
        return NSFetchRequest<Tag>(entityName: "Tag")
    }

    @NSManaged public var icon: String?
    @NSManaged public var title: String?
    @NSManaged public var race: Race?

}

extension Tag : Identifiable {

}
