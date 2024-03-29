//
//  Buttons.swift
//  Rate Watch
//
//  Created by Dave Hedden on 1/21/21.
//

import SwiftUI

struct CountAndRateButton: View {
    @ObservedObject var settings: Settings
    @ObservedObject var stopwatch: Stopwatch
    
    var body: some View {
        Button(action: {
            stopwatch.onTapCountAndRate()
            hapticWarning(isOn: settings.rateButtonHaptics)
        }) {
            LongRateButton(buttonIconName: "gauge.badge.plus", label: "COUNT & RATE", rateIconName: "\(Int(settings.rateBase)).circle.fill")
        }.buttonStyle(SolidButtonStyle(buttonColor: Color.flatBlueCAN, buttonColorPressed: Color.flatBlueCANHL))
    }
}

struct CountButton: View {
    @ObservedObject var settings: Settings
    @ObservedObject var stopwatch: Stopwatch
    
    var body: some View {
        Button(action: {
            stopwatch.onTapCount()
            hapticWarning(isOn: settings.rateButtonHaptics)
        }) {
            SmallButton(buttonIconName: "plus.circle.fill", label: "COUNT")
        }.buttonStyle(SolidButtonStyle(buttonColor: Color.flatBlueCAN, buttonColorPressed: Color.flatBlueCANHL))
    }
}

struct RateButton: View {
    @ObservedObject var settings: Settings
    @ObservedObject var stopwatch: Stopwatch
    
    var body: some View {
        Button(action: {
            stopwatch.onTapRate()
            hapticWarning(isOn: settings.rateButtonHaptics)
        }) {
            SmallRateButton(buttonIconName: "metronome.fill", label: "RATE", rateIconName: "\(Int(settings.rateBase)).circle.fill")
        }.buttonStyle(SolidButtonStyle(buttonColor: Color.flatBlueCAN, buttonColorPressed: Color.flatBlueCANHL))
    }
}

struct StopButton: View {
    @ObservedObject var settings: Settings
    @ObservedObject var stopwatch: Stopwatch
    
    var body: some View {
        Button(action: {
            stopwatch.onTapStop()
            hapticSuccess(isOn: settings.startButtonHaptics)
        }) {
            BigButton(buttonIconName: "stop.fill", label: "STOP")
        }.buttonStyle(SolidButtonStyle(buttonColor: Color.flatRedCAN, buttonColorPressed: Color.flatRedCANHL))
    }
}

struct StartButton: View {
    @ObservedObject var settings: Settings
    @ObservedObject var stopwatch: Stopwatch
    
    var body: some View {
        Button(action: {
            stopwatch.onTapStart()
            hapticSuccess(isOn: settings.startButtonHaptics)
        }) {
            BigButton(buttonIconName: "play.fill", label: "START")
        }.buttonStyle(SolidButtonStyle(buttonColor: Color.flatGreenCAN, buttonColorPressed: Color.flatGreenCANHL))
    }
}

struct LapButton: View {
    @ObservedObject var settings: Settings
    @ObservedObject var stopwatch: Stopwatch
    
    var body: some View {
        Button(action: {
            stopwatch.onTapLap()
            hapticSuccess(isOn: settings.lapButtonHaptics)
        }) {
            BigButton(buttonIconName: "repeat", label: "LAP")
        }.buttonStyle(SolidButtonStyle(buttonColor: Color.flatYellowCAN, buttonColorPressed: Color.flatYellowCANHL))
    }
}

struct Add5Button: View {
    @ObservedObject var settings: Settings
    @ObservedObject var stopwatch: Stopwatch
    
    var body: some View {
        Button(action: {
            stopwatch.onTapAdd5()
            hapticWarning(isOn: settings.add5ButtonHaptics)
        }) {
            SmallButton(buttonIconName: "forward.fill", label: "ADD :05")
        }.buttonStyle(SolidButtonStyle(buttonColor: Color.flatYellowCAN, buttonColorPressed: Color.flatYellowCANHL))
    }
}

struct SaveButton: View {
    @ObservedObject var settings: Settings
    @ObservedObject var stopwatch: Stopwatch
    
    var body: some View {
        Button(action: {
            stopwatch.onTapSave()
            hapticWarning(isOn: settings.saveButtonHaptics)
        }) {
            SmallButton(buttonIconName: "folder.fill.badge.plus", label: "SAVE")
        }.buttonStyle(SolidButtonStyle(buttonColor: Color.flatPurpleUK, buttonColorPressed: Color.flatPurpleUKHL))
    }
}

struct SaveButtonInactive: View {
    var body: some View {
        Button(action: {}) {
            SmallButtonInactive(buttonIconName: "folder.fill", label: "SAVED")
        }.buttonStyle(SolidButtonStyle(buttonColor: Color.flatSilverCAN, buttonColorPressed: Color.flatSilverCAN))
    }
}

struct ResetButton: View {
    @ObservedObject var settings: Settings
    @ObservedObject var stopwatch: Stopwatch
    
    var body: some View {
        Button(action: {
            stopwatch.onTapReset()
            hapticError(isOn: settings.resetButtonHaptics)
        }) {
            SmallButton(buttonIconName: "arrow.counterclockwise", label: "RESET")
        }.buttonStyle(SolidButtonStyle(buttonColor: Color.flatRedCAN, buttonColorPressed: Color.flatRedCANHL))
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        CountAndRateButton(settings: testSettings, stopwatch: testStopwatch)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
        
        RateButton(settings: testSettings, stopwatch: testStopwatch)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
        
        StartButton(settings: testSettings, stopwatch: testStopwatch)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
        
        StopButton(settings: testSettings, stopwatch: testStopwatch)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
        
        LapButton(settings: testSettings, stopwatch: testStopwatch)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
        
        SaveButton(settings: testSettings, stopwatch: testStopwatch)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
