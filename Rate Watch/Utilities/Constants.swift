//
//  Constants.swift
//  Rate Watch
//
//  Created by Dave Hedden on 1/21/21.
//

import Foundation

struct K {
    struct UserDefaultKeys {
        static let rateBase = "RateBase"
        static let rateUnits = "RateUnits"
        static let startButtonHaptics = "StartButtonHaptics"
        static let lapButtonHaptics = "LapButtonHaptics"
        static let rateButtonHaptics = "RateButtonHaptics"
        static let resetButtonHaptics = "ResetButtonHaptics"
        static let saveButtonHaptics = "SaveButtonHaptics"
        static let add5ButtonHaptics = "Add5ButtonHaptics"
    }
    
    struct RateUnits {
        static let cyclesPerMinute = "cyclesPerMinute"
        static let secondsPerCycle = "secondsPerCycle"
    }
}
