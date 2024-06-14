//
//  ListView.swift
//  Code Drop_Team 11
//
//  Created by Hyun Lee on 6/15/24.
//

import SwiftUI

struct ListView: View {
    var insights: [Insight] = [
        Insight(title: "중요한 정보는 왼쪽 위에 배치하세요.", detail: "사람들의 시선은 왼쪽 위에서부터 시작됩니다. 가장 중요한 정보는 왼쪽 위에 배치하는 것이 UX적으로 좋습니다."),
        Insight(title: "중요한 정보는 왼쪽 위에 배치하세요.", detail: "사람들의 시선은 왼쪽 위에서부터 시작됩니다. 가장 중요한 정보는 왼쪽 위에 배치하는 것이 UX적으로 좋습니다."),
        Insight(title: "중요한 정보는 왼쪽 위에 배치하세요.", detail: "사람들의 시선은 왼쪽 위에서부터 시작됩니다. 가장 중요한 정보는 왼쪽 위에 배치하는 것이 UX적으로 좋습니다."),
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(insights) { insight in
                    NavigationLink {
                        DetailView(insight: insight)
                    } label: {
                        VStack {
                            Text(insight.title)
                                .bold()
                            Text(insight.detail)
                        }
                    }
                    
                }
            }
        }
    }
}

#Preview {
    ListView()
}
