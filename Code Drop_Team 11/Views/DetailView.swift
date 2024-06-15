//
//  DetailView.swift
//  Code Drop_Team 11
//
//  Created by Hyun Lee on 6/15/24.
//

import SwiftUI

struct DetailView: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @EnvironmentObject var notificationManager: NotificationManager
    @EnvironmentObject var vm: HealthKitViewModel
    
    var insight: News
    
    var body: some View {
        List{
            Section {
                VStack(alignment: .leading, spacing: 16) {
                    HStack(spacing: 4) {
                        Text("var ").bold().foregroundColor(.appPink).font(.system(size: 17)) +
                        Text(insight.title)
                            .bold().font(.system(size: 17))
                    }.padding(.top, 32)
                    HStack(spacing: 0) {
                        Text("Text(").bold().foregroundColor(.appPurple).font(.system(size: 15)) +
                        Text("\"").font(.system(size: 15)) +
                        Text(insight.text).font(.system(size: 15)) +
                        Text("\"").font(.system(size: 15)) +
                        Text(")").bold().foregroundColor(.appPurple).font(.system(size: 15))
                    }.padding(.bottom, 32)
                }.padding(.leading, 16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .onAppear {
                        vm.healthRequest()
                        notificationManager.requestAuthorization()
                        vm.readStepsTakenToday()
                    }
                    .onReceive(timer, perform: { time in
                        vm.checkNeedToStand()
                        vm.checkGoodJob()
                    })
                    .padding()
                    .onChange(of: vm.isAuthorized){
                        print("Auth: \(vm.isAuthorized)")
                    }
            } header:{
                Text("인사이트").font(.title)
            }
            Section{
//                Link(destination: URL(string: insight.link )!) {
//                            Text("Safari App으로 이동해서 보여주기")
            }
        }.background(
            RoundedRectangle(cornerRadius: 16).foregroundColor(.appGray)
        ).listRowInsets(EdgeInsets())
        //        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DetailView(insight: News(title: "title", text: "text", link: "link"))
}
