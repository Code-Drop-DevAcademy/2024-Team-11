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
    
    var body: some View {
        VStack {
            if vm.isAuthorized {
                VStack {
                    Text("Today's Step Count")
                        .font(.title3)
                    
//                    Text("\(vm.userStepCount)")
//                        .font(.largeTitle)
//                        .fontWeight(.bold)
                    Text("\(seconds) seconds. Steps: \(vm.needToStand)")
                }
            } else {
                VStack {
                    Text("Please Authorize Health!")
                        .font(.title3)
                    
                    Button {
                        vm.healthRequest()
                    } label: {
                        Text("Authorize HealthKit")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    .frame(width: 320, height: 55)
                    .background(Color(.orange))
                    .cornerRadius(10)
                }
            }
            
        }
        .onReceive(timer, perform: { time in
            seconds = time
            vm.checkNeedToStand()
//            isTime = vm.needToStand
            
        })
        .padding()
        .onChange(of: vm.isAuthorized){
            print("Auth: \(vm.isAuthorized)")
        }
        .onAppear {
            vm.readStepsTakenToday()
        }
    }
}

#Preview {
    ContentView()
}
