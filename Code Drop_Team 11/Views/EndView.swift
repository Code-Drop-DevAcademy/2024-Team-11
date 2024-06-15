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
                    .foregroundColor(.gray)
                VStack {
                    Text("Text(\"\(random?.title ?? "")\")")
                    Text("\(random?.text ?? "")")
//                    Spacer()
                    Text("- \(random?.name ?? "")")
                }
            }
            Spacer()
            Button{
//                notificationManager.
                router.push(.homeView)
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
