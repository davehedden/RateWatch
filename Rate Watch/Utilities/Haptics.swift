//
//  Haptics.swift
//  Rate Watch
//
//  Created by Dave Hedden on 1/21/21.
//

import Foundation
import SwiftUI

func hapticSuccess() {
    let generator = UINotificationFeedbackGenerator()
    generator.notificationOccurred(.success)
}

func hapticError() {
    let generator = UINotificationFeedbackGenerator()
    generator.notificationOccurred(.error)
}

func hapticWarning() {
    let generator = UINotificationFeedbackGenerator()
    generator.notificationOccurred(.warning)
}
