//
//  Settings.swift
//  Rate Watch
//
//  Created by Dave Hedden on 1/21/21.
//

import Foundation

var defaults = UserDefaults.standard

//enum RateUnits {
//    case cyclesPerMinute
//    case secondsPerCycle
//}

final class Settings: ObservableObject {
    
    @Published var rateBase: Double {
        didSet {
            defaults.setValue(rateBase, forKey: K.UserDefaultKeys.rateBase)
        }
    }
    
    @Published var rateUnits: String {
        didSet {
            defaults.setValue(rateUnits, forKeyPath: K.UserDefaultKeys.rateUnits)
        }
    }
    
    @Published var buttonsFlippedHorizontally: Bool {
        didSet {
            defaults.setValue(buttonsFlippedHorizontally, forKeyPath: K.UserDefaultKeys.buttonsFlippedHorizontally)
        }
    }
    
    @Published var quickTapAddsHalfStroke: Bool {
        didSet {
            defaults.setValue(quickTapAddsHalfStroke, forKeyPath: K.UserDefaultKeys.quickTapAddsHalfStroke)
        }
    }
    
    var startButtonHaptics: Bool {
        didSet {
            defaults.setValue(startButtonHaptics, forKeyPath: K.UserDefaultKeys.startButtonHaptics)
        }
    }
    
    var lapButtonHaptics: Bool {
        didSet {
            defaults.setValue(lapButtonHaptics, forKeyPath: K.UserDefaultKeys.lapButtonHaptics)
        }
    }
    
    var rateButtonHaptics: Bool {
        didSet {
            defaults.setValue(rateButtonHaptics, forKeyPath: K.UserDefaultKeys.rateButtonHaptics)
        }
    }
    
    var resetButtonHaptics: Bool {
        didSet {
            defaults.setValue(resetButtonHaptics, forKeyPath: K.UserDefaultKeys.resetButtonHaptics)
        }
    }
    
    var saveButtonHaptics: Bool {
        didSet {
            defaults.setValue(saveButtonHaptics, forKeyPath: K.UserDefaultKeys.saveButtonHaptics)
        }
    }
    
    var add5ButtonHaptics: Bool {
        didSet {
            defaults.setValue(add5ButtonHaptics, forKeyPath: K.UserDefaultKeys.add5ButtonHaptics)
        }
    }
    
    init() {
        self.rateBase = defaults.object(forKey: K.UserDefaultKeys.rateBase) as? Double ?? 3.0
        self.rateUnits = defaults.object(forKey: K.UserDefaultKeys.rateUnits) as? String ?? K.RateUnits.secondsPerCycle
        self.buttonsFlippedHorizontally = defaults.object(forKey: K.UserDefaultKeys.buttonsFlippedHorizontally) as? Bool ?? false
        self.quickTapAddsHalfStroke = defaults.object(forKey: K.UserDefaultKeys.quickTapAddsHalfStroke) as? Bool ?? false
        self.startButtonHaptics = defaults.object(forKey: K.UserDefaultKeys.startButtonHaptics) as? Bool ?? true
        self.lapButtonHaptics = defaults.object(forKey: K.UserDefaultKeys.lapButtonHaptics) as? Bool ?? true
        self.rateButtonHaptics = defaults.object(forKey: K.UserDefaultKeys.rateButtonHaptics) as? Bool ?? true
        self.resetButtonHaptics = defaults.object(forKey: K.UserDefaultKeys.resetButtonHaptics) as? Bool ?? true
        self.saveButtonHaptics = defaults.object(forKey: K.UserDefaultKeys.saveButtonHaptics) as? Bool ?? true
        self.add5ButtonHaptics = defaults.object(forKey: K.UserDefaultKeys.add5ButtonHaptics) as? Bool ?? true
    }
}
