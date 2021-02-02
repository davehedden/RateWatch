//
//  TestData.swift
//  Rate Watch
//
//  Created by Dave Hedden on 1/21/21.
//

import Foundation

var testSettings: Settings = Settings()
var testStopwatch: Stopwatch = Stopwatch()

var sampleRace1Lap1 = TempLap(id: 1.1, raceID: 1.0, lapNum: 1, cumTime: 31.48, lapTime: 31.48, lapTimeAlternate: 0, strokeCount: 14, strokeRates: [1.13, 1.18, 1.19], rateUnits: K.RateUnits.secondsPerCycle)
var sampleRace1Lap2 = TempLap(id: 1.2, raceID: 1.0, lapNum: 2, cumTime: 65.74, lapTime: 34.26, lapTimeAlternate: 65.74, strokeCount: 16, strokeRates: [1.19, 1.22, 1.22], rateUnits: K.RateUnits.secondsPerCycle)
var sampleRace1Lap3 = TempLap(id: 1.3, raceID: 1.0, lapNum: 3, cumTime: 100.71, lapTime: 34.97, lapTimeAlternate: 0, strokeCount: 17, strokeRates: [1.24, 1.24, 1.25], rateUnits: K.RateUnits.secondsPerCycle)
var sampleRace1Lap4 = TempLap(id: 1.4, raceID: 1.0, lapNum: 4, cumTime: 133.79, lapTime: 33.08, lapTimeAlternate: 68.05, strokeCount: 18, strokeRates: [1.21, 1.21, 1.17], rateUnits: K.RateUnits.secondsPerCycle)

var sampleRace2Lap1 = TempLap(id: 2.1, raceID: 2.0, lapNum: 1, cumTime: 32.48, lapTime: 32.48, lapTimeAlternate: 0, strokeCount: 15, strokeRates: [1.23, 1.28, 1.29], rateUnits: K.RateUnits.secondsPerCycle)
var sampleRace2Lap2 = TempLap(id: 2.2, raceID: 2.0, lapNum: 2, cumTime: 67.74, lapTime: 35.26, lapTimeAlternate: 67.74, strokeCount: 17, strokeRates: [1.29, 1.32, 1.32], rateUnits: K.RateUnits.secondsPerCycle)
var sampleRace2Lap3 = TempLap(id: 2.3, raceID: 2.0, lapNum: 3, cumTime: 103.71, lapTime: 35.97, lapTimeAlternate: 0, strokeCount: 18, strokeRates: [1.34, 1.34, 1.35], rateUnits: K.RateUnits.secondsPerCycle)
var sampleRace2Lap4 = TempLap(id: 2.4, raceID: 2.0, lapNum: 4, cumTime: 137.79, lapTime: 34.08, lapTimeAlternate: 70.05, strokeCount: 19, strokeRates: [1.31, 1.31, 1.27], rateUnits: K.RateUnits.secondsPerCycle)

var sampleRace3Lap1 = TempLap(id: 3.1, raceID: 3.0, lapNum: 1, cumTime: 42.48, lapTime: 42.48, lapTimeAlternate: 0, strokeCount: 19, strokeRates: [1.53, 1.58, 1.59], rateUnits: K.RateUnits.secondsPerCycle)
var sampleRace3Lap2 = TempLap(id: 3.2, raceID: 3.0, lapNum: 2, cumTime: 87.74, lapTime: 45.26, lapTimeAlternate: 87.74, strokeCount: 21, strokeRates: [1.59, 1.62, 1.62], rateUnits: K.RateUnits.secondsPerCycle)
var sampleRace3Lap3 = TempLap(id: 3.3, raceID: 3.0, lapNum: 3, cumTime: 133.71, lapTime: 45.97, lapTimeAlternate: 0, strokeCount: 22, strokeRates: [1.64, 1.64, 1.65], rateUnits: K.RateUnits.secondsPerCycle)
var sampleRace3Lap4 = TempLap(id: 3.4, raceID: 3.0, lapNum: 4, cumTime: 177.79, lapTime: 44.08, lapTimeAlternate: 90.05, strokeCount: 23, strokeRates: [1.61, 1.61, 1.57], rateUnits: K.RateUnits.secondsPerCycle)

var sampleRace4Lap1 = TempLap(id: 4.1, raceID: 4.0, lapNum: 1, cumTime: 40.48, lapTime: 40.48, lapTimeAlternate: 0, strokeCount: 18, strokeRates: [71.3, 71.4, 71.9], rateUnits: K.RateUnits.cyclesPerMinute)
var sampleRace4Lap2 = TempLap(id: 4.2, raceID: 4.0, lapNum: 2, cumTime: 83.74, lapTime: 43.26, lapTimeAlternate: 83.74, strokeCount: 20, strokeRates: [67.4, 71.2, 70.4], rateUnits: K.RateUnits.cyclesPerMinute)
var sampleRace4Lap3 = TempLap(id: 4.3, raceID: 4.0, lapNum: 3, cumTime: 127.71, lapTime: 43.97, lapTimeAlternate: 0, strokeCount: 21, strokeRates: [66.6, 68.6, 69.5], rateUnits: K.RateUnits.cyclesPerMinute)
var sampleRace4Lap4 = TempLap(id: 4.4, raceID: 4.0, lapNum: 4, cumTime: 169.79, lapTime: 42.08, lapTimeAlternate: 86.05, strokeCount: 22, strokeRates: [71.6, 70.1, 71.7], rateUnits: K.RateUnits.cyclesPerMinute)

var sampleRace5Lap222 = TempLap(id: 5.1, raceID: 5.0, lapNum: 222, cumTime: 1364.79, lapTime: 1364.08, lapTimeAlternate: 1683.05, strokeCount: 222, strokeRates: [52.28, 52.29, 62.47], rateUnits: K.RateUnits.cyclesPerMinute)

var sampleLapArray1 = [
    sampleRace1Lap1,
    sampleRace1Lap2,
    sampleRace1Lap3,
    sampleRace1Lap4
]

var sampleLapArray2 = [
    sampleRace2Lap1,
    sampleRace2Lap2,
    sampleRace2Lap3,
    sampleRace2Lap4
]

var sampleLapArray3 = [
    sampleRace3Lap1,
    sampleRace3Lap2,
    sampleRace3Lap3,
    sampleRace3Lap4
]

var sampleLapArray4 = [
    sampleRace4Lap1,
    sampleRace4Lap2,
    sampleRace4Lap3,
    sampleRace4Lap4
]

var samplePredicate = NSPredicate(format: "raceID == 1.0")

//var sampleRace1 = Race(id: 1.0, laps: sampleLapArray1)
//var sampleRace2 = Race(id: 2.0, laps: sampleLapArray2)
//var sampleRace3 = Race(id: 3.0, laps: sampleLapArray3)
//var sampleRace4 = Race(id: 4.0, laps: sampleLapArray4)

//var sampleRaceArray1 = [
//    sampleRace1,
//    sampleRace2,
//    sampleRace3,
//    sampleRace4
//]
