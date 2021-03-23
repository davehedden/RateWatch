//
//  StopwatchView.swift
//  Rate Watch
//
//  Created by Dave Hedden on 1/21/21.
//

import SwiftUI

struct StopwatchView: View {
    
    // MARK: - Properties
    @ObservedObject var settings = Settings()
    @ObservedObject var stopwatch = Stopwatch()
    
    // MARK: - Body
    var body: some View {
        // Container for main view
        VStack {
            
            TimerDisplay(settings: settings, stopwatch: stopwatch)
            
            Divider()
                .frame(height: 1)
                .background(Color(.systemGray4))
            
            ButtonDisplay(settings: settings, stopwatch: stopwatch)
            
            Divider()
                .frame(height: 1)
                .background(Color(.systemGray4))
            
            LapDisplay(stopwatch: stopwatch)
            
            Spacer()
            
            Divider()
                .frame(height: 1)
                .background(Color(.systemGray4))
            
            MenuBar(settings: settings, stopwatch: stopwatch)
            
        }
        .padding(.horizontal, 16)
        .preferredColorScheme(.dark)
        .onAppear {
            UIApplication.shared.isIdleTimerDisabled = true
        }
        .onDisappear {
            UIApplication.shared.isIdleTimerDisabled = false
        } // End of VStack for Main View
    } // End of Body
}

struct StopwatchView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StopwatchView(stopwatch: testStopwatch)
                .previewDevice("iPhone X")
            StopwatchView(stopwatch: testStopwatch)
                .previewDevice("iPhone 12 mini")
            StopwatchView(stopwatch: testStopwatch)
                .previewDevice("iPhone 12 Pro Max")
        }
        
    }
}
