//
//  ProjectTestApp.swift
//  ProjectTest
//
//  Created by Danilo Luongo on 16/10/23.
//

import SwiftUI

@main
struct MoodAppDemoApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                SummaryView()
                    .tabItem { Label("", systemImage: "calendar")}
                TaskHubView()
                    .tabItem { Label("", systemImage: "list.clipboard") }
                RewardView()
                    .tabItem { Label("", systemImage: "lock.fill") }
                AnimalFarmView()
                    .tabItem { Label("", systemImage: "person.fill") }
            }
        }
    }
}
