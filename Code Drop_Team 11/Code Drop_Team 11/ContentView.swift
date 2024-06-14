//
//  ContentView.swift
//  Code Drop_Team 11
//
//  Created by Hyun Lee on 6/15/24.
//

import SwiftUI
import HealthKit

struct ContentView: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @EnvironmentObject var vm: HealthKitViewModel
    @State var seconds = Date()
    @State var isTime = false
    @StateObject private var notificationManager = NotificationManager.instance
    
    var body: some View {
        VStack {
            Button(action: {
                notificationManager.newsNotification()
            }, label: {
                Text("10초 후 알림 보내기")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })
        }
        .onAppear {
            notificationManager.requestAuthorization()
            vm.healthRequest()
            vm.readStepsTakenToday()
        }
        .onReceive(timer, perform: { time in
            seconds = time
            vm.checkNeedToStand()
        })
        .padding()
        .onChange(of: vm.isAuthorized){
            print("Auth: \(vm.isAuthorized)")
        }
    }
}
