//
//  HomeView.swift
//  Code Drop_Team 11
//
//  Created by Hyun Lee on 6/15/24.
//

import SwiftUI

import SwiftUI

struct HomeView: View {
    @State private var isShowingDetail = false
    @EnvironmentObject var router: Router
    @EnvironmentObject var notificationManager: NotificationManager
    @EnvironmentObject var vm: HealthKitViewModel
    
    var body: some View {
        NavigationStack(path: $router.path) {
            VStack {
                Spacer()
                Image("Group 9")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                Text("업무를 시작해볼까요?")
                    .foregroundColor(.white)
                Text("중간에 잠깐 쉬고 걷는 것은 효율에 도움이 돼요.")
                    .foregroundColor(.white)
                Spacer()
                HStack{
                    Button("시작하기") {
//                        router.backToRoot()
                        router.push(.listView)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(8)
                    .padding()
                    .frame(width: 124, height:56)
                }
                
                
//                NavigationLink(destination: ListView()
//                    .environmentObject(notificationManager)
//                    .environmentObject(router)
//                               , isActive: $isShowingDetail) {
//                    EmptyView()
//                }
            }
            .navigationDestination(for: Destination.self){ destination in
                switch destination{
                case .listView:
                    ListView()
                        .environmentObject(notificationManager)
                        .environmentObject(router)
                case .endView:
                    EndView()
                        .environmentObject(notificationManager)
                        .environmentObject(router)
                case .homeView:
                    HomeView()
                        .environmentObject(notificationManager)
                        .environmentObject(router)
                        .environmentObject(vm)
                default:
                    ListView()
                        .environmentObject(notificationManager)
                        .environmentObject(router)
                }
            }

            .background(Color.black)
            .navigationTitle("6월 15일")
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }
    }
}

#Preview {
    HomeView()
}
