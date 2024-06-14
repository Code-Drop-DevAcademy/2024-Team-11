//
//  NotificationManager.swift
//  Code Drop_Team 11
//
//  Created by 김이예은 on 6/15/24.
//

import SwiftUI
import UserNotifications

class NotificationManager: ObservableObject {
    static let instance = NotificationManager()
    
    @Published var authorizationStatus: UNAuthorizationStatus = .notDetermined
    ///데이터파일 대신 publish 배열로 만들었어요
    @Published var todayNews: [News] = []
    
    
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

