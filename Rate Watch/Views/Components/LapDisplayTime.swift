//
//  LapDisplayTime.swift
//  Rate Watch
//
//  Created by Dave Hedden on 1/21/21.
//

import SwiftUI

var sampleCum: TimeInterval = 1222.99
var sampleLap: TimeInterval = 536.47
var sampleRateSecondsPerCycle: TimeInterval = 2.29
var sampleRateCyclesPerMinute: Double = 62.24

struct LapDisplayTime: View {
    var time: TimeInterval
    var type: TimerDisplayType
    
    var body: some View {
        
        switch type {
        case .cumulative:
            Text(String(time.formattedLapDisplay()))
                .font(.system(size: 14))
                .fontWeight(.bold)
                .frame(width: 68, alignment: .trailing)
        case .lap:
            if time == 0 {
                Text("")
            } else {
                Text(String(time.formattedLapDisplay()))
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                    .frame(width: 68, alignment: .trailing)
            }
        case .rateCyclesPerMinute:
            Text(String(time.formattedRateDisplay(units: K.RateUnits.cyclesPerMinute)))
                .font(.system(size: 14))
                .fontWeight(.medium)
                .frame(width: 36, alignment: .trailing)
        case .rateSecondsPerCycle:
            Text(String(time.formattedRateDisplay(units: K.RateUnits.secondsPerCycle)))
                .font(.system(size: 14))
                .fontWeight(.medium)
                .frame(width: 36, alignment: .trailing)
        }
    }
}

struct LapDisplayTime_Previews: PreviewProvider {
    static var previews: some View {
        LapDisplayTime(time: sampleCum, type: .cumulative)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
        
        LapDisplayTime(time: sampleLap, type: .lap)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
        
        LapDisplayTime(time: sampleRateSecondsPerCycle, type: .rateSecondsPerCycle)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
        
        LapDisplayTime(time: sampleRateCyclesPerMinute, type: .rateCyclesPerMinute)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
