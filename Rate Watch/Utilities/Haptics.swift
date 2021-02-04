//
//  Haptics.swift
//  Rate Watch
//
//  Created by Dave Hedden on 1/21/21.
//

import Foundation
import SwiftUI

func hapticSuccess(isOn: Bool) {
    if isOn {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
}

func hapticError(isOn: Bool) {
    if isOn {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.error)
    }
}

func hapticWarning(isOn: Bool) {
    if isOn {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.warning)
    }
}
