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
            TabView {
                SummaryView()
                    .tabItem { Label("", systemImage: "calendar")}
                TaskHubView()
                    .tabItem { Label("", systemImage: "list.clipboard") }
                PuzzleView(sharedViewModel: sharedViewModel)
                    .tabItem { Label("", systemImage: "lock.fill") }
                AnimalFarmView(sharedViewModel: sharedViewModel)
                    .tabItem { Label("", systemImage: "person.fill") }
            }
        }
    }
}
