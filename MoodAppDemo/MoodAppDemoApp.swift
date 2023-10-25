//
//  ProjectTestApp.swift
//  ProjectTest
//
//  Created by Danilo Luongo on 16/10/23.
//

import SwiftUI
import SwiftData

@main
struct MoodAppDemoApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Day.self,
            Calendar.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
        }
        .modelContainer(sharedModelContainer)
    }
}
