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
    @StateObject var notificationManager = NotificationManager()
    @StateObject var router = Router()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(vm)
                .environmentObject(router)
                .environmentObject(notificationManager)
            
        }
    }
}
