//
//  Code_Drop_Team_11App.swift
//  Code Drop_Team 11
//
//  Created by Hyun Lee on 6/15/24.
//

import SwiftUI
import SwiftData

@main
struct Code_Drop_Team_11App: App {
    var vm = HealthKitViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(vm)
        }.modelContainer(for: News.self)
    }
}
