//
//  Persistence.swift
//  Rate Watch
//
//  Created by Dave Hedden on 1/12/21.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let sampleData = PersistenceController(inMemory: true)
        let viewContext = sampleData.container.viewContext
        
        let newRace = Race(context: viewContext)
        newRace.id = 1.0
        newRace.timestamp = Date()
        newRace.title = "Test race"
        
        let newLap1 = Lap(context: viewContext)
        newLap1.id = 1.1
        newLap1.raceID = 1.0
        newLap1.lapNum = 1
        newLap1.cumTime = 31.48
        newLap1.lapTime = 31.48
        newLap1.lapTimeAlternate = 0
        newLap1.strokeCount = 14
        newLap1.strokeRates = [1.13, 1.18, 1.19]
        newLap1.rateUnits = K.RateUnits.secondsPerCycle
        newLap1.race = newRace
        
        let newLap2 = Lap(context: viewContext)
        newLap2.id = 1.2
        newLap2.raceID = 1.0
        newLap2.lapNum = 2
        newLap2.cumTime = 65.74
        newLap2.lapTime = 34.26
        newLap2.lapTimeAlternate = 65.74
        newLap2.strokeCount = 16
        newLap2.strokeRates = [1.19, 1.22, 1.22]
        newLap2.rateUnits = K.RateUnits.secondsPerCycle
        newLap2.race = newRace
        
        let newLap3 = Lap(context: viewContext)
        newLap3.id = 1.3
        newLap3.raceID = 1.0
        newLap3.lapNum = 3
        newLap3.cumTime = 100.71
        newLap3.lapTime = 34.97
        newLap3.lapTimeAlternate = 0
        newLap3.strokeCount = 17
        newLap3.strokeRates = [1.24, 1.24, 1.25]
        newLap3.rateUnits = K.RateUnits.secondsPerCycle
        newLap3.race = newRace
        
        let newLap4 = Lap(context: viewContext)
        newLap4.id = 1.4
        newLap4.raceID = 1.0
        newLap4.lapNum = 4
        newLap4.cumTime = 133.79
        newLap4.lapTime = 33.08
        newLap4.lapTimeAlternate = 68.05
        newLap4.strokeCount = 18
        newLap4.strokeRates = [1.21, 1.21, 1.17]
        newLap4.rateUnits = K.RateUnits.secondsPerCycle
        newLap4.race = newRace
        
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
        return sampleData
    }()

    let container: NSPersistentCloudKitContainer

    init(inMemory: Bool = false) {
        container = NSPersistentCloudKitContainer(name: "Data")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                Typical reasons for an error here include:
                * The parent directory does not exist, cannot be created, or disallows writing.
                * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                * The device is out of space.
                * The store could not be migrated to the current model version.
                Check the error message to determine what the actual problem was.
                */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}
