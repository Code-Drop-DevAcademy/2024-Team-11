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
    @Published var userStepCount = ""
    @Published var isAuthorized = false
    
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
    
    func isBeenOneHour() -> Bool {
        guard let startDate = Calendar.current.date(byAdding: .hour, value: -1, to: Date()) else {return false}
        var startStep:Double = 0
        var nowStep:Double = 0
        healthKitManager.readStepCount(forToday: startDate, healthStore: healthStore) { step in
            startStep = step
        }
        healthKitManager.readStepCount(forToday: Date(), healthStore: healthStore) { step in
            nowStep = step
        }
        
        if (nowStep - startStep) < 10{
            return true
        }else{
            return false
        }
    }
    
}
