//
//  Quotes.swift
//  Code Drop_Team 11
//
//  Created by 김이예은 on 6/15/24.
//

import Foundation

struct Quotes: Hashable {
    var title: String
    var text: String
    var name: String
}

var AllQuotes: [Quotes] = [
    Quotes(title: "남에게 이기는 방법의 하나는 예의범절로 이기는 것이다.", text: "One of the greatest victories you can gain over someone is to beat him at politeness.", name: "조쉬 빌링스 Josh Billings"),
    Quotes(title: "노력은 결실을 맺습니다. 노력은 변화를 일으킵니다.", text: "It’s hard work that makes things happen. It’s hard work that creates change.", name: "미국 TV 프로듀서 션다 라임스 Shonda Rhimes"),
    Quotes(title: "표면상의 노력보다 진정한 생산성에 더 높은 가치를 두세요.", text: "Elevate true productivity over the appearance of hard work.", name: "미국 사업가이자 작가 스콧 벨스키 Scott Belsky"),
    Quotes(title: "내일의 실현을 가로막는 유일한 한계는 오늘을 의심하는 것입니다.", text: "The only limit to our realization of tomorrow will be our doubts of today.", name: "미국 정치인이자 32대 미국 대통령 루즈벨트 Franklin D. Roosevelt"),
    Quotes(title: "무언가가 몹시 중요하다면 성공할 가능성이 희박하더라도 시도하세요.", text: "When something is important enough, you do it even if the odds are not in your favor.", name: "SpaceX 창립자이자 CEO 및 Tesla, Inc. CEO 일론 머스크 Elon Musk"),
    Quotes(title: "진리는 언제나 다양성과 혼돈이 아닌 단순함 속에서 발견됩니다.", text: "If I have seen further, it is by standing on the shoulders of giants.", name: "영국 수학자 아이작 뉴턴 Isaac Newton"),
    Quotes(title: "가장 큰 위험은 위험을 무릅쓰지 않는 것입니다. 급변하는 세상에서 실패할 수밖에 없는 전략은 위험을 감수하지 않는 것입니다.", text: "The biggest risk is not taking any risk… In a world that changes really quickly, the only strategy that is guaranteed to fail is not taking risks.", name: "인터넷 사업가이자 Facebook 공동 창업자 마크 주커버그 Mark Zuckerberg"),
    Quotes(title: "단기간의 성과에는 가차 없이 정직해지고 장기적으로는 낙관과 자신감을 가지세요.", text: "Be brutally honest about the short term and optimistic and confident about the long term.", name: "미국 사업가이자 Netflix 공동 CEO 리드 해스팅스 Reed Hastings"),
    Quotes(title: "어디서 출발했느냐는 중요하지 않습니다. 어디로 가고 있느냐가 중요합니다.", text: "It doesn't matter where you are coming from. All that matters is where you are going.", name: "캐나다계 미국인 동기 부여 연설가이자 자기 계발 저자 브라이언 트레이시 Brian Tracy"),
    Quotes(title: "대담함은 근육과 같습니다. 더욱더 훈련할수록 두려움이 나를 지배하지 않을 만큼 자연스러워진다는 것을 인생의 경험을 통해 알고 있습니다.", text: "Fearlessness is like a muscle. I know from my own life that the more I exercise it the more natural it becomes to not let my fears run me.", name: "그리스계 미국인 저자이자 사업가 아리아나 허핑턴 Arianna Huffington"),
    Quotes(title: "잘 모른다고 겁먹지 마세요. 이는 뛰어난 강점이 될 수도 있습니다. 그 누구와도 다르게 시도해 볼 수 있기 때문입니다.", text: "Don't be intimidated by what you don't know. That can be your greatest strength and ensure that you do things differently from everyone else.", name: "미국 사업가 사라 브래클리 Sara Blakely"),
    Quotes(title: "긍정적인 생각은 어려움을 이겨내고, 고통을 다스리고, 새로운 목표에 도달할 수 있도록 돕는 소중한 도구입니다.", text: "Positive thinking is a valuable tool that can help you overcome obstacles, deal with pain, and reach new goals.", name: "심리 치료사이자 정신 건강 트레이너 에이미 모린 Amy Morin"),
    Quotes(title: "사람들은 선택할 수 있는 능력이 있고 바꿀 수 있는 힘이 있습니다.", text: "What people have the capacity to choose, they have the ability to change.", name: "미국 정치인 마델린 올브라이트 Madeleine Albright"),
    Quotes(title: "스스로가 받아들이지 않으면 그 누구도 당신에게 열등감을 느끼게 할 수 없습니다.", text: "No one can make you feel inferior without your consent.", name: "미국의 정치적 인물이자 전 영부인 엘리노어 루즈벨트 Eleanor Roosevelt"),
    Quotes(title: "용기를 가지고 자신의 마음과 직관을 따르세요. 여러분의 마음과 직관은 자신이 진정으로 무엇을 이루고 싶은지 이미 알고 있습니다. 그 이외의 것들은 부차적일 뿐입니다.", text: "Great things in business are never done by one person; they’re done by a team of people.", name: "미국의 사업가이자 Apple의 전 CEO 스티브 잡스 Steve Jobs")
]
