//
//  Constants.swift
//  Rate Watch
//
//  Created by Dave Hedden on 1/21/21.
//

import Foundation

struct K {
    struct Instructions {
        static let add5ButtonHeading = "Add :05 Button"
        static let add5ButtonInstructions = "When the stopwatch is in its initial state (stopped and reset to 0), the ADD :05 button will be displayed. Each time it is tapped, 5 seconds will be added to the initial start time. This is useful if you miss the start of a race and need to advance the stopwatch up to a point when you can sync the stopwatch timer with the race clock."
        
        static let countButtonHeading = "Count Button"
        static let countButtonInstructions = "This button is used to track and record cycle counts for each lap during a race. Tapping the COUNT button increments the counter, which is shown in the Timer Display area. The cycle count for each lap is displayed in the Lap Display area. The COUNT button can be used with or without the timer running. The counter is reset to 0 afer tapping the LAP or RESET button."
        
        static let countSettingsHeading = "Count Button Settings"
        static let countSettingsInstructions = "In freestyle and backstroke, a swimmer may finish a lap with half a stroke cycle. In settings, you can choose to turn on the option for AUTO HALF STROKE MODE, which will enable the stopwatch to detect and account for these instances. When this setting is turned off, the COUNT button will always increment by 1. When this setting is turned on, if the interval between the last two times you hit the COUNT button gets faster by more than 30%, it will switch into half stroke mode and the COUNT button will start incrementing by 0.5 instead of 1. In practical use, while you're watching a race, when a swimmer is nearing the wall, you can switch to tapping the COUNT button on every hand entry instead of every other hand entry, and the stopwatch will detect this change and record a more accurate stroke count. After you press the LAP button or RESET button, the COUNT button will increment by 1 full stroke again until it detects another change in frequency."
        
        static let lapDisplayHeading = "Lap Display"
        static let lapDisplayInstructions = "Each time the LAP button is tapped, the lap data for the new lap is added into the Lap Display area:"
        
        static let rateButtonHeading = "Rate Button"
        static let rateButtonInstructions = "This button is used to track and record stroke rates for each lap during a race. The most recent stroke rate is shown in the Timer Display area. The median stroke rate for each lap is displayed in the Lap Display area, and tapping the lap row will expand the view to show all the stroke rates taken for that lap. The RATE button can be used with or without the timer running. The stroke rate timer is reinitialized afer tapping the LAP or RESET button."
        
        static let rateHowToHeading = "How to Take Stroke Rates"
        static let rateHowToInstructions = "The following example will use a person swimming freestyle, and assumes the CYCLES TO COUNT setting is set to the default of 3. When the swimmer's right hand (either hand can be chosen) enters the water, you tap the RATE button. The next time the right hand enters the water (after 1 full stroke cycle), you count 1, then after the second full cycle you count 2, then on the third time the right hand enters the water you tap the RATE button again. The stopwatch will take the time interval between the last 2 times you tapped the RATE button, and divide that time interval by 3 (because the CYCLES TO COUNT setting is set to 3) to calculate the average stroke rate over the last 3 cycles. You can continue tapping the RATE button after every third full stroke cycle to repeatedly update the stroke rate."
        
        static let rateSettingsHeading = "Stroke Rate Settings"
        static let rateSettingsInstructions = "In settings, you can set the CYCLES TO COUNT to 1, 2 or 3 cycles. Setting it to 1 will combine the COUNT and RATE buttons into one single button that increments the stroke counter and takes the stroke rate all in one button tap. This allows for more convenience, however the individual stroke rates will be less precise than when setting it to 2 or 3 cycles. Also in settings, you can choose to record and display rate units as either Seconds Per Cycle (default) or Cycles Per Minute."
        
        static let saveButtonHeading = "Save Button"
        static let saveButtonInstructions = "After the STOP button is tapped, the SAVE button will be displayed. Tapping the SAVE button will save the lap data to phone storage, and the button will be grayed out indicating that the data has been stored. Saved data can be accessed by tapping the FOLDER icon in the bottom left corner of the app. If it has not been saved, data from the current stopwatch session will be erased upon tapping the RESET button, and the SAVE button will no longer be displayed."
        
    }
    
    struct RateUnits {
        static let cyclesPerMinute = "cyclesPerMinute"
        static let secondsPerCycle = "secondsPerCycle"
    }
    
    struct UserDefaultKeys {
        static let rateBase = "RateBase"
        static let rateUnits = "RateUnits"
        static let startButtonHaptics = "StartButtonHaptics"
        static let lapButtonHaptics = "LapButtonHaptics"
        static let rateButtonHaptics = "RateButtonHaptics"
        static let resetButtonHaptics = "ResetButtonHaptics"
        static let saveButtonHaptics = "SaveButtonHaptics"
        static let add5ButtonHaptics = "Add5ButtonHaptics"
        static let buttonsFlippedHorizontally = "ButtonsFlippedHorizontally"
        static let automateHalfStrokes = "QuickTapAddsHalfStroke"
    }
}
