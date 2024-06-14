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
    
    var body: some View {
        NavigationView {
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
                Button("시작하기") {
                    self.isShowingDetail.toggle()
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.green)
                .cornerRadius(8)
                .padding()
                
//                NavigationLink(destination: ListView(), isActive: $isShowingDetail) {
//                    EmptyView()
//                }
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
