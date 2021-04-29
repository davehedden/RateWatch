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

//let countFormatter: NumberFormatter = {
//    let formatter = NumberFormatter()
//    formatter.minimumFractionDigits = 0
//    formatter.maximumFractionDigits = 1
//
//    // Avoid not getting a zero on numbers lower than 1
//    // Eg: .5, .67, etc...
//    formatter.numberStyle = .decimal
//    return formatter
//}()

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
//    formatter.timeStyle = .medium
    return formatter
}()

let datetimeFormatter: DateFormatter = {
    let formatter = DateFormatter()
//    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

let timerDisplayFormatter = timeFormatterGenerator(zeroPaddingSetting: .pad)
let lapTimeFormatter = timeFormatterGenerator(zeroPaddingSetting: .default)
