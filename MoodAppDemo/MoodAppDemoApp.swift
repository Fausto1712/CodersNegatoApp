//
//  ProjectTestApp.swift
//  ProjectTest
//
//  Created by Danilo Luongo on 16/10/23.
//

import SwiftUI

@main
struct MoodAppDemoApp: App {
    @StateObject var sharedViewModel = SharedViewModel()
    var body: some Scene {
        WindowGroup {
            SummaryView()
        }
    }
}
