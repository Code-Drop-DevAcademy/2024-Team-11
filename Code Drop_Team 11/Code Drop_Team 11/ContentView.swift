//
//  ContentView.swift
//  Code Drop_Team 11
//
//  Created by Hyun Lee on 6/15/24.
//

import SwiftUI
import HealthKit

struct ContentView: View {
    @EnvironmentObject var vm: HealthKitViewModel
    
    var body: some View {
        VStack {
            if vm.isAuthorized {
                VStack {
                    Text("Today's Step Count")
                        .font(.title3)
                    
                    Text("\(vm.userStepCount)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
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
