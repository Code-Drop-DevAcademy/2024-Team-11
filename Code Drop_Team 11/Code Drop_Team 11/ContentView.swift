//
//  ContentView.swift
//  Code Drop_Team 11
//
//  Created by Hyun Lee on 6/15/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var notificationManager = NotificationManager.instance
    
    var body: some View {
        VStack {
            Button(action: {
                notificationManager.requestAuthorization()
                notificationManager.sendNotification()
            }, label: {
                Text("1분 후 알림 보내기")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })
        }
        .onAppear {
            notificationManager.requestAuthorization()
        }
    }
}
