//
//  DetailView.swift
//  Code Drop_Team 11
//
//  Created by Hyun Lee on 6/15/24.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var notificationManager: NotificationManager
    @EnvironmentObject var vm: HealthKitViewModel
    
    var insight: News
    
    var body: some View {
        VStack {
            Text("인사이트")
                .multilineTextAlignment(.leading)
                .font(.title)
                .bold()
            Text(insight.title)
                .font(.largeTitle)
                .padding()
            Text(insight.text)
                .font(.body)
                .padding()
            Spacer()
            
            Text("관련 자료")
                .multilineTextAlignment(.leading)
                .font(.title)
                .bold()
            Link(destination: URL(string: "https://www.naver.com" )!) {
                Text("Safari App으로 이동해서 보여주기")
            }
            .foregroundColor(.white)
            Spacer()
            
        }
//        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DetailView(insight: News(title: "title", text: "text", link: "link"))
}
