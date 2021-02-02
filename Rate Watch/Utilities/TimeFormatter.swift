//
//  TimeFormatter.swift
//  Rate Watch
//
//  Created by Dave Hedden on 1/21/21.
//

import Foundation

enum TimerDisplayType {
    case cumulative
    case lap
    case rateSecondsPerCycle
    case rateCyclesPerMinute
}

func timeFormatterGenerator(zeroPaddingSetting: DateComponentsFormatter.ZeroFormattingBehavior) -> DateComponentsFormatter {
    let timeFormatter = DateComponentsFormatter()
    timeFormatter.allowsFractionalUnits = true
    timeFormatter.allowedUnits = [.minute, .second]
    timeFormatter.zeroFormattingBehavior = zeroPaddingSetting
    return timeFormatter
}

let timerDisplayFormatter = timeFormatterGenerator(zeroPaddingSetting: .pad)
let lapTimeFormatter = timeFormatterGenerator(zeroPaddingSetting: .default)
