//
//  HealthKitViewModel.swift
//  Code Drop_Team 11
//
//  Created by Hyun Lee on 6/15/24.
//

import Foundation
import HealthKit

class HealthKitViewModel: ObservableObject {
    
    private var healthStore = HKHealthStore()
    private var healthKitManager = HealthKitManager()
    private var notificationManager = NotificationManager()
    
    @Published var userStepCount = ""
    @Published var isAuthorized = false
    @Published var needToStand = false
    @Published var sentMoveNotification = false
    
    init() {
        changeAuthorizationStatus()
    }
    
    //MARK: - HealthKit Authorization Request Method
    func healthRequest() {
        healthKitManager.setUpHealthRequest(healthStore: healthStore) { [self] in
            self.changeAuthorizationStatus()
            guard let stepQtyType = HKObjectType.quantityType(forIdentifier: .stepCount) else { return }
            let status = self.healthStore.authorizationStatus(for: stepQtyType)
            
            switch status {
            case .notDetermined:
                isAuthorized = false
            case .sharingDenied:
                isAuthorized = false
            case .sharingAuthorized:
                DispatchQueue.main.async {
                    print("Authorised")
                    self.isAuthorized = true
                }
            @unknown default:
                isAuthorized = false
            }
            self.readStepsTakenToday()
        }
    }
    
    func changeAuthorizationStatus() {
        guard let stepQtyType = HKObjectType.quantityType(forIdentifier: .stepCount) else { return }
        let status = self.healthStore.authorizationStatus(for: stepQtyType)
        
        switch status {
        case .notDetermined:
            isAuthorized = false
        case .sharingDenied:
            isAuthorized = false
        case .sharingAuthorized:
            DispatchQueue.main.async {
                print("Authorised")
                self.isAuthorized = true
            }
        @unknown default:
            isAuthorized = false
        }
    }
    
    //MARK: - Read User's Step Count
    func readStepsTakenToday() {
        healthKitManager.readStepCount(forToday: Date(), healthStore: healthStore) { step in
            if step != 0.0 {
                DispatchQueue.main.async {
                    self.userStepCount = String(format: "%.0f", step)
                }
            }
        }
    }
    
    func isBeenOneHour(completion: @escaping (Bool) -> Void) {
        guard let startDate = Calendar.current.date(byAdding: .minute, value: -1, to: Date()) else {
            completion(false)
            return
        }
        healthKitManager.readStepCount(forToday: startDate, healthStore: healthStore) { step in
            let startStep = step
            if startStep < 10 {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    func checkNeedToStand(){
        isBeenOneHour(){ result in
            DispatchQueue.main.async{ [self] in
                self.needToStand = result
                if result && !sentMoveNotification{
                    notificationManager.moveNotification()
                    sentMoveNotification = true
                    print("Send: \(sentMoveNotification)")
                }else if !result{
                    sentMoveNotification = false
                    print("refresh: \(sentMoveNotification)")
                }
            }
        }
    }
    
}
