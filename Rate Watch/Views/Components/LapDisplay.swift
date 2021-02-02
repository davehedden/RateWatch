//
//  LapDisplay.swift
//  Rate Watch
//
//  Created by Dave Hedden on 1/21/21.
//

import SwiftUI

struct LapDisplay: View {
    @ObservedObject var stopwatch: Stopwatch
    
    var body: some View {
        VStack {
            LapDisplayRowHeader()
            
            LapDisplayList(stopwatch: stopwatch)
        }
    }
}

struct LapDisplay_Previews: PreviewProvider {
    static var previews: some View {
        LapDisplay(stopwatch: testStopwatch)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
