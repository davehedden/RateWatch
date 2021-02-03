//
//  TimerDisplay.swift
//  Rate Watch
//
//  Created by Dave Hedden on 1/21/21.
//

import SwiftUI

struct TimerDisplay: View {
    @ObservedObject var settings: Settings
    @ObservedObject var stopwatch: Stopwatch
    
    var body: some View {
        VStack {
            
            // Cumulative Timer
            HStack {
                
                Spacer()
                
                Text(stopwatch.cumTimeDisplay)
                    .font(Font.custom("alarm clock", size: 64))
                
                TimerLabel(label: "Total")
                
            } // End of Cumulative Timer
            
            // Lap Timer
            HStack {
                
                Spacer()
                
                Text(String(format: "%03d", stopwatch.lapCount))
                    .font(Font.custom("alarm clock", size: 20))
                
                Text(stopwatch.lapTimeDisplay)
                    .font(Font.custom("alarm clock", size: 52))
                
                TimerLabel(label: "Lap  ")
                
            } // End of Lap Timer
            
            // Count Tracker & Rate Timer
            HStack {
                TimerLabel(label: "Count")
                
                Text(String(format: "%02d", stopwatch.strokeCount))
                    .font(Font.custom("alarm clock", size: 36))
                
                Spacer()
                
                Text(stopwatch.strokeRate.formattedRateDisplay(units: settings.rateUnits))
                    .font(Font.custom("alarm clock", size: 36))
                
                TimerLabel(label: "Rate ")
                
            } // End of Count Tracker & Rate Timer
        }
    }
}

struct TimerDisplay_Previews: PreviewProvider {
    static var previews: some View {
        TimerDisplay(settings: testSettings, stopwatch: testStopwatch)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}

struct TimerLabel: View {
    let label: String
    
    var body: some View {
        Text(label)
            .font(.system(size: 14))
            .italic()
            .foregroundColor(.flatGrayCANHL)
    }
}
