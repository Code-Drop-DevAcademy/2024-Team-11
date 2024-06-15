//
//  ListView.swift
//  Code Drop_Team 11
//
//  Created by Hyun Lee on 6/15/24.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var router: Router
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @EnvironmentObject var vm: HealthKitViewModel
    @EnvironmentObject var notificationManager: NotificationManager
    @State var isShowingDetail = false
    
    var array = [News(title: "title", text: "text", link: "link"),
                 News(title: "title", text: "text", link: "link"),
                 News(title: "title", text: "text", link: "link"),
                 News(title: "title", text: "text", link: "link"),
                 News(title: "title", text: "text", link: "link")]
    
    
    var body: some View {
        //notificationManager.todayNews
            List(0..<array.count) { item in
//                var news = notificationManager.todayNews
                var news = array
                NavigationLink(destination: DetailView(insight: news[item]).environmentObject(vm).environmentObject(notificationManager)){
                    VStack{
                        Text("\(news[item].title)")
                        Text("\(news[item].text)")
                    }
                }
            }.safeAreaInset(edge: .bottom, spacing: 0) {
                footerView
            }
            .navigationDestination(for: Destination.self){ destination in
                switch destination{
                case .endView:
                    EndView()
                        .environmentObject(notificationManager)
                        .environmentObject(router)
                default:
                    EndView()
                        .environmentObject(notificationManager)
                        .environmentObject(router)
                }
            }
            .navigationTitle("6월15일")
                .navigationBarBackButtonHidden(true)
                .onAppear {
                    vm.healthRequest()
                    notificationManager.requestAuthorization()
                    vm.readStepsTakenToday()
                }
                .onReceive(timer, perform: { time in
                    vm.checkNeedToStand()
                })
                .padding()
                .onChange(of: vm.isAuthorized){
                    print("Auth: \(vm.isAuthorized)")
                }    }
    var footerView: some View {
        return HStack{
            Button("X 종료하기") {
//                router.backToRoot()
                router.push(.endView)
//                isShowingDetail = true
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.green)
            .cornerRadius(8)
            .padding()
            .frame(width: 124, height:56)
        }
        
        
//        NavigationLink {
//            ZStack{
//                RoundedRectangle(cornerRadius: 16)
//                    .foregroundColor(.green)
//                    .frame(width: 124, height:56)
//                Text("X 종료하기")
//            }
//        }
//        NavigationLink(destination: EndView()
//            .environmentObject(router)
//            .environmentObject(notificationManager)
//            ){
//                ZStack{
//                    RoundedRectangle(cornerRadius: 16)
//                        .foregroundColor(.green)
//                        .frame(width: 124, height:56)
//                    Text("X 종료하기")
//                        .foregroundStyle(Color(.white))
//                }
//            }
    }
}

#Preview {
    ListView()
}
