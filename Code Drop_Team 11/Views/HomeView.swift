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
                Image("homeImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                VStack(alignment: .leading){
                    Text("import ").foregroundColor(.appPink).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/) +
                    Text("업무를 시작해볼까요?")
                        .foregroundColor(.white)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text("중간에 잠깐 쉬고 걷는 것은 효율에 도움이 돼요.")
                        .foregroundColor(.white)
                    Text("걸을때 읽기 좋은 인사이트 보내드릴게요.")
                        .foregroundColor(.white)
                }
                Spacer()
                HStack{
                    Button("시작하기") {
                        //                        router.backToRoot()
                        router.push(.listView)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.accentColor)
                    .cornerRadius(8)
                    .padding()
                    .frame(width: 124, height:56)
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
                .onAppear(){
                    vm.healthRequest()
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

//#Preview {
//    HomeView()
//}
