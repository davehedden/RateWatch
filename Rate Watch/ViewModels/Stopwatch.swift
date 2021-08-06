//
//  Stopwatch.swift
//  Rate Watch
//
//  Created by Dave Hedden on 1/21/21. test
//

import Foundation
import QuartzCore
import CoreData
import SwiftUI

enum TimerStatus {
    case initial
    case running
    case paused
}

class Stopwatch: ObservableObject {
    
    var viewContext: NSManagedObjectContext = PersistenceController.shared.container.viewContext
    
    // MARK: Stopwatch Timer Properties
    @Published var timerStatus: TimerStatus = .initial
    @Published var cumTimeDisplay: String = 0.formattedTimerDisplay()
    @Published var lapTimeDisplay: String = 0.formattedTimerDisplay()
    @Published var lapCount: Int = 0
    var startTimeAdjustment: TimeInterval = 0
    var secondsSinceTapStart: TimeInterval = 0
    var secondsSinceTapLap: TimeInterval = 0
    var timerDisplayLink: CADisplayLink? = nil
    var timeOnRefresh: TimeInterval = 0
    var timeOnTapStart: TimeInterval = 0
    var timeOnTapLap: TimeInterval = 0
    var timeOnTapStop: TimeInterval = 0
    var cumTimeOnLastTap: TimeInterval = 0
    var lapTimeOnLastTap: TimeInterval = 0
    var lapTimeAlternate: TimeInterval = 0
    var lapTimesArray: [TimeInterval] = []
    
    // MARK: Stroke Count & Stroke Rate Properties
    @Published var strokeCount: Double = 0
    @Published var strokeRate: TimeInterval = 0
    var timeOnTapRate: TimeInterval = 0
    var strokeRates: [TimeInterval] = []
    var rateUnits: String = defaults.object(forKey: K.UserDefaultKeys.rateUnits) as? String ?? K.RateUnits.secondsPerCycle
    var rateBase: Double = defaults.object(forKey: K.UserDefaultKeys.rateBase) as? Double ?? 3.0
    var autoHalfStrokeModeOn: Bool = defaults.object(forKey: K.UserDefaultKeys.automateHalfStrokes) as? Bool ?? false
    var timeOnLastTapCount: TimeInterval = 0
    var lastCountInterval: TimeInterval = 0
    var halfStrokesEnabled: Bool = false
    
    // MARK: Save Functionality Properties
    @Published var tempLapArray: [TempLap] = []
    @Published var raceIsSaved: Bool = false
    var raceID: Double?
    var raceTimestamp: Date?
    var lapDataOnLastTap: TempLap?
    
    
    // MARK: - Stopwatch Timer Methods
    func startTimer() {
        if timerStatus == .initial {
            // Change stopwatch status to running
            timerStatus = .running
            
            // Store the timestamp of when the timer was started, copy it as the same timestamp for when the lap timer started
            timeOnTapStart = CACurrentMediaTime().truncate(toPlaces: 2)
            timeOnTapStart -= startTimeAdjustment
            timeOnTapLap = timeOnTapStart
            
            // Start the CADisplayLink timer on the main RunLoop in common mode, set isPaused property to false
            timerDisplayLink = CADisplayLink(target: self, selector: #selector(refreshTime))
            timerDisplayLink?.add(to: .main, forMode: .common)
            timerDisplayLink?.isPaused = false
            
        } else if timerStatus == .paused {
            // Change stopwatch status to running
            timerStatus = .running
            
            // Store the timestamp of when the timer was started, copy it as the same timestamp for when the lap timer started
            timeOnTapStart = CACurrentMediaTime().truncate(toPlaces: 2)
            timeOnTapLap = timeOnTapStart
            timeOnTapStart -= startTimeAdjustment
            
            // Start the CADisplayLink timer on the main RunLoop in common mode, set isPaused property to false
            timerDisplayLink?.add(to: .main, forMode: .common)
            timerDisplayLink?.isPaused = false
        }
    }
    
    @objc func refreshTime() {
        /// While the CADisplayLink timer is running, this function is called each time the screen refreshes (60 times per second)
        
        // Each time the screen refreshes, first capture the timestamp of the current time
        timeOnRefresh = CACurrentMediaTime().truncate(toPlaces: 2)
        
        // Then subtract the timestamp of the start time from the current time to calculate the total elapsed time in seconds
        secondsSinceTapStart = timeOnRefresh - timeOnTapStart
        cumTimeDisplay = secondsSinceTapStart.formattedTimerDisplay()
        
        // Also subtract the timestamp of the last time the lap button was tapped from the current time to calculate total elapsed time in seconds for the current lap
        secondsSinceTapLap = timeOnRefresh - timeOnTapLap
        lapTimeDisplay = secondsSinceTapLap.formattedTimerDisplay()
    }
    
    func getLapTime() {
        // Store the timestamp of when the lap button was pressed
        let now = CACurrentMediaTime().truncate(toPlaces: 2)
        
        // Store the current cumulative time & lap time variables for use later
        cumTimeOnLastTap = (now - timeOnTapStart).round(toPlaces: 2)
        lapTimeOnLastTap = (now - timeOnTapLap).round(toPlaces: 2)
        
        // Update the timeOnTapLap variable to now
        timeOnTapLap = now
        
        // Increment the lap counter by 1
        lapCount += 1
        
        // Store the lap time in the lapTimeArray
        lapTimesArray.append(lapTimeOnLastTap)
        
        // Calculate the lapTimeSum, if applicable (i.e. if it is an evan numbered lap, sum the last 2 laps together)
        if lapCount % 2 == 0 {
            lapTimeAlternate = lapTimesArray[(lapTimesArray.count - 1)] + lapTimesArray[(lapTimesArray.count - 2)]
        } else {
            lapTimeAlternate = 0
        }
    }
    
    func stopTimer() {
        // Change the stopwatch status to paused
        timerStatus = .paused
        
        // Store the timestamp of when the stop button was pressed
        let now = CACurrentMediaTime().truncate(toPlaces: 2)
        timeOnTapStop = now
        
        // Change the start time adjustment to the current cumulative time, so if the start button is pressed again, it starts up from the current cumulative time, not from zero
        startTimeAdjustment = cumTimeOnLastTap

        // Stop the timer
        timerDisplayLink?.remove(from: .main, forMode: .common)
        timerDisplayLink?.isPaused = true // was set to false and was working fine, but seems like this should be true, setting as true as test
        
        // Update the timer display
        secondsSinceTapStart = cumTimeOnLastTap
        secondsSinceTapLap = lapTimeOnLastTap
        cumTimeDisplay = secondsSinceTapStart.formattedTimerDisplay()
        lapTimeDisplay = secondsSinceTapLap.formattedTimerDisplay()
    }
    
    func updateInitialTimerDisplay() {
        cumTimeDisplay = startTimeAdjustment.formattedTimerDisplay()
        lapTimeDisplay = startTimeAdjustment.formattedTimerDisplay()
    }
}


// MARK: - Button Methods
extension Stopwatch {
    func onTapAdd5() {
        /// This function is called whenever the ADD :05 button is tapped
        
        // Add 5 seconds to the start time adjustment value
        startTimeAdjustment += 5.00
        
        // Update the display for the cumulative & lap timers
        updateInitialTimerDisplay()
    }
    
    func onTapCount() {
        /// This function is called whenever the COUNT button is tapped
        if autoHalfStrokeModeOn {
            if timeOnLastTapCount == 0 {
                strokeCount += 1
                timeOnLastTapCount = CACurrentMediaTime().truncate(toPlaces: 2)
            } else {
                let now = CACurrentMediaTime().truncate(toPlaces: 2)
                let currentCountInterval = now - timeOnLastTapCount
                
                if halfStrokesEnabled {
                    strokeCount += 0.5
                } else {
                    if currentCountInterval < (0.7 * lastCountInterval) {
                        halfStrokesEnabled = true
                        strokeCount += 0.5
                    } else {
                        strokeCount += 1
                    }
                }
                
                // Update the timestamp of when the count button was last pressed
                timeOnLastTapCount = now
                lastCountInterval = currentCountInterval
            }
            
        } else {
            // Increment the stroke count by 1
            strokeCount += 1
        }
    }
    
    func onTapCountAndRate() {
        /// This function is called whenever the COUNT & RATE button is tapped (the combined button that appears when the cycle base is set to 1)
        onTapCount()
        onTapRate()
    }
    
    func onTapLap() {
        /// This function is called whenever the LAP button is tapped
        
        // Call the stopwatch to get the lap time and increment the lap counter
        getLapTime()
        
        // Store the lap data
        saveTempLap()
        
        // Reset the stroke count and stroke rate data
        resetCountAndRateData()
    }
    
    func onTapRate() {
        /// This function is called whenever the RATE button is tapped

        // Call the rate timer to get the stroke rate, based on current rateUnits & rateBase settings
        getRate(units: rateUnits, cycles: rateBase)
    }
    
    func onTapReset() {
        /// This function is called whenever the RESET button is tapped
        
        // Stopwatch Timer
        timerStatus = .initial
        cumTimeDisplay = 0.formattedTimerDisplay()
        lapTimeDisplay = 0.formattedTimerDisplay()
        lapCount = 0
        startTimeAdjustment = 0
        secondsSinceTapStart = 0
        secondsSinceTapLap = 0
        timerDisplayLink = nil
        timeOnRefresh = 0
        timeOnTapStart = 0
        timeOnTapLap = 0
        timeOnTapStop = 0
        cumTimeOnLastTap = 0
        lapTimeOnLastTap = 0
        lapTimeAlternate = 0
        lapTimesArray.removeAll()
        
        // Stroke Count & Stroke Rate
        strokeCount = 0
        strokeRate = 0
        timeOnTapRate = 0
        strokeRates.removeAll()
        timeOnLastTapCount = 0
        lastCountInterval = 0
        halfStrokesEnabled = false
        
        // Saved Data
        tempLapArray.removeAll()
        raceIsSaved = false
        lapDataOnLastTap = nil
    }
    
    func onTapSave() {
        /// This function is called whenever the SAVE button is tapped
        
        // Toggle raceIsSaved to true in order to deactivate the Save button
        raceIsSaved = true
        
        // Save the Race and Laps to persistent storage
        saveRaceAndLaps()
        
    }
    
    func onTapStart() {
        /// This function is called whenever the START button is tapped
        
        // Store a unique ID for race (seconds since 1970)
        raceID = Date().timeIntervalSince1970
        
        // Store the datetime of when the start button was pressed (to be used as a unique identifer for this timer session)
        raceTimestamp = Date()
        
        // Call the stopwatch to start the timer
        startTimer()
    }
    
    func onTapStop() {
        /// This function is called whenever the STOP button is tapped
        
        // Call the stopwatch to get the lap time
        getLapTime()
        
        // Store the lap data
        saveTempLap()
        
        // Call the stopwatch to stop the timer
        stopTimer()
        
        // Reset the strokeCount and strokeRate data so it is ready to record new lap data if the timer is started again
        resetCountAndRateData()
    }
    
    func resetCountAndRateData() {
        // Reset the stroke count to 0 for the next lap
        strokeCount = 0
        
        // Reset the timeOnTapRate to 0 for the next lap to start with fresh data for the new lap
        timeOnTapRate = 0
        
        // Clear the stroke rate array so that stroke rates from the previous lap do not get added to the current lap data
        strokeRates.removeAll()
        
        // Reset count button intervals
        timeOnLastTapCount = 0
        lastCountInterval = 0
        
        // Deactivate half strokes
        halfStrokesEnabled = false
    }
}


// MARK: - Rate Timer Methods
extension Stopwatch {
    
    func getRate(units: String, cycles: Double) {
        if timeOnTapRate == 0 {
            // If it is the first time being tapped, simply store the current time when the button was tapped
            timeOnTapRate = CACurrentMediaTime().truncate(toPlaces: 2)
        } else {
            // Otherwise, store the current time and calculate the seconds passed since the last time the button was tapped
            let now = CACurrentMediaTime().truncate(toPlaces: 2)
            let secondsSinceTapRate = now - timeOnTapRate
            
            // Update the timestamp of when the rate button was last pressed
            timeOnTapRate = now

            // Calculate the stroke rate based on the units and rate base cycles settings
            strokeRate = calculateRate(time: secondsSinceTapRate, cycles: cycles, units: units)

            // Store the stroke rate in the stroke rate array
            strokeRates.append(strokeRate)
        }
    }
    
    func calculateRate(time: TimeInterval, cycles: Double, units: String) -> TimeInterval {
        if units == K.RateUnits.cyclesPerMinute {
            return (cycles * 60.0 / time).round(toPlaces: 1)
        } else {
            return (time / cycles).round(toPlaces: 2)
        }
    }
}


// MARK: - Persistence Functions
extension Stopwatch {
    
    func saveTempLap() {
        // Set a unique lap ID as the current time interval since 1970
        let lapID = Date().timeIntervalSince1970
    
        // Temporarily store the current lap in the teampLap dictionary so that it can be displayed
        lapDataOnLastTap = TempLap(id: lapID, raceID: raceID!, lapNum: lapCount, cumTime: cumTimeOnLastTap, lapTime: lapTimeOnLastTap, lapTimeAlternate: lapTimeAlternate, strokeCount: strokeCount, strokeRates: strokeRates, rateUnits: rateUnits)
        tempLapArray.append(lapDataOnLastTap!)
    }
    
    func createLaps(lapArray: [TempLap], race: Race) {
        for lap in lapArray {
            let newLap = Lap(context: viewContext)
            newLap.id = lap.id!
            newLap.raceID = lap.raceID!
            newLap.lapNum = lap.lapNum
            newLap.cumTime = lap.cumTime
            newLap.lapTime = lap.lapTime
            newLap.lapTimeAlternate = lap.lapTimeAlternate
            newLap.strokeCount = lap.strokeCount
            newLap.strokeRates = lap.strokeRates
            newLap.rateUnits = lap.rateUnits
            newLap.race = race
        }
    }
    
    func saveRaceAndLaps() {
//        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        let newRace = Race(context: viewContext)
        if let newID = raceID, let newTimestamp = raceTimestamp {
            newRace.id = newID
            newRace.timestamp = newTimestamp
            newRace.title = "\(dateFormatter.string(from: newTimestamp)) \(datetimeFormatter.string(from: newTimestamp)) \(cumTimeOnLastTap.formattedLapDisplay())"
        }
        
        createLaps(lapArray: tempLapArray, race: newRace)
        
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
    }
    
}
