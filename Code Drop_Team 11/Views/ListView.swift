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
    @State var insights: [News] = NotificationManager.instance.todayNews
    //    var array = [News(title: "title", text: "text", link: "link"),
    //                 News(title: "title", text: "text", link: "link"),
    //                 News(title: "title", text: "text", link: "link"),
    //                 News(title: "title", text: "text", link: "link"),
    //                 News(title: "title", text: "text", link: "link")]
    @State var selectedInsight: News = News(title: "", text: "", link: "")
    
    var body: some View {
        //notificationManager.todayNews
        List {
            ForEach(insights) { insight in
                NavigationLink {
                    DetailView(insight: insight).environmentObject(vm).environmentObject(notificationManager)
                } label: {
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
                }
            }.background(
                RoundedRectangle(cornerRadius: 16).foregroundColor(.appGray)
            ).listRowInsets(EdgeInsets())
        }.safeAreaInset(edge: .bottom, spacing: 0) {
            footerView
        }
        .navigationTitle("6월15일")
        .navigationBarBackButtonHidden(true)
        .onAppear {
            vm.healthRequest()
            notificationManager.requestAuthorization()
            vm.readStepsTakenToday()
            
        }
        .onReceive(timer, perform: { time in
            print("timer")
            vm.checkNeedToStand()
            vm.checkGoodJob()
        })
        .padding()
        .onChange(of: vm.isAuthorized){
            print("Auth: \(vm.isAuthorized)")
        }
    }
    var footerView: some View {
        return HStack{
            Button("X 종료하기") {
                //                router.backToRoot()
                router.push(.endView)
                //                isShowingDetail = true
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.accentColor)
            .cornerRadius(8)
            .padding()
            //            .frame(width: 124, height:56)
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


//import SwiftUI
//struct ListView: View {
//    @State var insights: [News] = NotificationManager.instance.todayNews
//
//    var body: some View {
//        NavigationStack {
//            List {
//                ForEach(insights) { insight in
//                    NavigationLink {
//                        //                        DetailView(insight: insight)
//                    } label: {
//                        VStack(alignment: .leading, spacing: 16) {
//                            HStack(spacing: 4) {
//                                Text("var").bold().foregroundColor(.appPink).font(.system(size: 17))
//                                Text(insight.title)
//                                    .bold().font(.system(size: 17))
//                            }.padding(.top, 32)
//                            HStack(spacing: 0) {
//                                Text("Text").bold().foregroundColor(.appPurple).font(.system(size: 15))
//                                Text("(\"").font(.system(size: 15))
//                                Text(insight.text).font(.system(size: 15))
//                                Text("\")").font(.system(size: 15))
//                            }.padding(.bottom, 32)
//                        }.padding(.leading, 16)
//                        .frame(maxWidth: .infinity, alignment: .leading)
//
////                        .cornerRadius(32)
//                    }
//                }.background(
//                    RoundedRectangle(cornerRadius: 16).foregroundColor(.appGray)
//                ).listRowInsets(EdgeInsets())
//            }
//        }
//        .listRowSpacing(4)
//            .frame(maxWidth: .infinity, alignment: .leading)
//                .listStyle(PlainListStyle())
//
//    }
//}
#Preview {
    ListView()
}
