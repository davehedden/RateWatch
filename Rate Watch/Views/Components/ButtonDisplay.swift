//
//  ButtonDisplay.swift
//  Rate Watch
//
//  Created by Dave Hedden on 1/21/21.
//

import SwiftUI

struct ButtonDisplay: View {
    @ObservedObject var settings: Settings
    @ObservedObject var stopwatch: Stopwatch
    
    var body: some View {
        VStack {
            
            // Row containing Count & Rate buttons
            HStack(spacing: 20) {
                
                if settings.rateBase == 1.0 {
                    // If the stroke rate base is set to 1, combine the Count and Rate buttons into one long button
                    CountAndRateButton(settings: settings, stopwatch: stopwatch)
                    
                } else {
                    // Otherwise, show the Count and Rate buttons separately
                    CountButton(stopwatch: stopwatch)
                    
                    RateButton(settings: settings, stopwatch: stopwatch)
                }
                
            }.frame(height: 65)
            
            // Row containing Start/Stop & Reset buttons
            HStack(spacing: 20) {
                // Start or Stop button
                if stopwatch.timerStatus == .running {
                    StopButton(stopwatch: stopwatch)
                } else {
                    StartButton(stopwatch: stopwatch)
                }
                
                // Lap or Add5/Save & Reset buttons
                if stopwatch.timerStatus == .running {
                    LapButton(stopwatch: stopwatch)
                } else {
                    VStack(spacing: 20) {
                        
                        if stopwatch.timerStatus == .initial {
                            // Add 5 button
                            Add5Button(stopwatch: stopwatch)
                        } else {
                            if stopwatch.raceIsSaved == false {
                                SaveButton(stopwatch: stopwatch)
                            } else {
                                SaveButtonInactive()
                            }
                        }
                        
                        ResetButton(stopwatch: stopwatch)
                        
                    }.frame(height: 130)
                }
            }
            .padding(.top, 20)
            .padding(.bottom, 10)
            
        }
        .padding(.top, 10)
    }
}

struct ButtonDisplay_Previews: PreviewProvider {
    static var previews: some View {
        ButtonDisplay(settings: testSettings, stopwatch: testStopwatch)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
