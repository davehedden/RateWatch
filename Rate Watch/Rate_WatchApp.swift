//
//  Rate_WatchApp.swift
//  Rate Watch
//
//  Created by Dave Hedden on 1/12/21.
//

import SwiftUI

@main
struct Rate_WatchApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            StopwatchView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
