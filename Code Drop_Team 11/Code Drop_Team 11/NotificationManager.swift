//
//  NotificationManager.swift
//  Code Drop_Team 11
//
//  Created by 김이예은 on 6/15/24.
//

import SwiftUI
import UserNotifications
import SwiftData

class NotificationManager: ObservableObject {
    @Environment(\.modelContext) private var modelContext
    static let instance = NotificationManager()
    
    @Published var authorizationStatus: UNAuthorizationStatus = .notDetermined
    ///데이터파일 대신 publish 배열로 만들었어요
    @Published var todayNews: [News] = [News(title: "웹 프론트엔드 개발자와 UI/UX 디자이너가 효과적으로 협업하는 방법", text: "웹 서비스를 구축하는 실무에서 웹 프론트엔드 개발자로 업무를 하다 보면 기획자, UI/UX 디자이너와 협업을 많이 하게 됩니다. 물론, 작은 개발 프로젝트의 경우 기획, 디자이너가 없이 개발을 하게 될 수도 있습니다. 그런데, 개발자들만 있어도 누군가는 기획자, 디자이너의 역할을 하게 됩니다. 기획을 해야 하는 개발자 입장에서도 본 글은 많은 도움이 될 것으로 생각이 듭니다. 필자가 웹 프론트엔드 개발자로 일 하다보면 기획자, 디자이너가 누가 됐던 비슷하게 업무적으로 부족한 부분들이 보였었고, 상당수 기획자, 디자이너는 같은 점들의 보완점이 보여서 그 내용을 공유하고자 합니다. 때로는 기획자, 디자이너들이 정의해주지 않고 놓치는 것들은 기획자, 디자이너가 덜 중요하다고 생각하지만 개발자에게는 무척 중요한 일입니다. 왜냐하면 요구사항이 정확하지 않으면 개발이 산으로 갈 수도 있기 때문입니다. 기획이나 디자인 요건이 불명확하면 안타깝게도 개발은 산으로 갑니다. 개발 요건이 없다면 개발자로서는 상상의 나래를 펼쳐 필요 이상의 확장성 등을 생각하여 비즈니스 요건, 기획 요건과는 다르게 쓸데 없는 기능을 개발 할 수도 있고, 개발자는 정의되지 않는 것들에 대해 실현 발생 가능한 상황을 놓치고 개발하여 추후 버그가 발생하기도 합니다. 기획자 디자이너와 협업 시 업무 경험의 차이와 방식의 차이는 있을 수 있지만, 이 글을 읽은 웹 개발자, 기획/디자이너면 좀 더 효과적으로 업무를 할 수 있었으면 좋겠습니다.", link: "https://devocean.sk.com/blog/techBoardDetail.do?ID=166014&boardType=techBlog&ref=codenary")]
    
    
    init() {
        requestAuthorization()
    }
    
    func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                DispatchQueue.main.async{
                    self.authorizationStatus = .authorized}
                print("Notification authorization granted")
            } else {
                self.authorizationStatus = .denied
                print("Notification authorization denied: \(error?.localizedDescription ?? "")")
            }
        }
    }
    func newsNotification() {
        if let randomNews = AllNews.randomElement() {
            if !todayNews.contains(randomNews) {
                ///알림의 내용을 설정할 수 있는 클래스를 선언한 변수
                let content = UNMutableNotificationContent()
                content.title = "return 인사이트💡"
                content.body = randomNews.text
                content.sound = UNNotificationSound.default
                
                ///알림이 발송될 시간 간격 설정; 60초 후에, 반복은 없이
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
                ///알림 요청 객체 생성
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                //알림을 시스템에 예약
                UNUserNotificationCenter.current().add(request) { error in
                    if let error = error {
                        print("Failed to schedule notification: \(error.localizedDescription)")
                    } else {
                        print("Notification scheduled successfully")
                        DispatchQueue.main.async {
                            self.todayNews.append(randomNews)
//                            self.modelContext.insert(randomNews)
                        }
                    }
                }
            }
            
        }
    }
    
    func moveNotification() {
        let content = UNMutableNotificationContent()
        content.title = "일어나세요!"
        content.body = "2시간 동안 열심히 일했어요! 이제 일어나서 걸어볼까요?"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Failed to schedule notification: \(error.localizedDescription)")
            } else {
                print("Notification scheduled successfully")
            }
        }
    }
}

