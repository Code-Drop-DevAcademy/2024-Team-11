//
//  EndView.swift
//  Code Drop_Team 11
//
//  Created by Hyun Lee on 6/15/24.
//

import SwiftUI

struct EndView: View {
    var body: some View {
        @EnvironmentObject var router: Router
        @EnvironmentObject var notificationManager: NotificationManager
        
        var random = AllQuotes.randomElement()
        VStack{
            Spacer()
            ZStack{
                RoundedRectangle(cornerRadius: 32)
                    .frame(width:393, height: 224)
                    .foregroundColor(.appGray)
                VStack {
                    HStack {
                        Text("Text(").bold().foregroundColor(.appPurple).font(.system(size: 15)) +
                        Text("\"\(random?.title ?? "")\"")
                            .foregroundColor(.appOrange) +
                        Text(")").bold().foregroundColor(.appPurple).font(.system(size: 15)) as! Text
                    }.padding(4)
                    Text("\(random?.text ?? "")").padding(4)
//                    Spacer()
                    Text("- \(random?.name ?? "")").foregroundColor(.gray)
                }
            }
            Spacer()
//            NavigationLink(destination: HomeView().environmentObject(vm).environmentObject(router).environmentObject(notificationManager)){
//                ZStack{
//                    RoundedRectangle(cornerRadius: 16)
//                        .foregroundColor(.green)
//                        .frame(width: 354, height:54)
//                    Text("홈으로")
//                        .foregroundStyle(Color(.white))
//                }
//            }
            Button{
//                notificationManager.
//                router.push(.homeView)
//                router.backToRoot()
            }label:{
                ZStack{
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(.green)
                        .frame(width: 354, height:54)
                    Text("홈으로")
                        .foregroundStyle(Color(.white))
                }
            }
        }
        
    }
}

#Preview {
    EndView()
}
