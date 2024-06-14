////
////  Steps.swift
////  Code Drop_Team 11
////
////  Created by Hyun Lee on 6/15/24.
////
//
//import Foundation
//import HealthKit
//
//class HealthKitManager: ObservableObject{
//    static let shared = HealthKitManager()
//    
//    var healthStore = HKHealthStore()
//    
//    var stepCountToday: Int = 0
//    
//    func requestAuthorization(readSteps: @escaping () -> Void) {
//        let stepCount = Set([HKObjectType.quantityType(forIdentifier: .stepCount)!])
//        
//        if HKHealthStore.isHealthDataAvailable(){
//            healthStore.requestAuthorization(toShare: stepCount, read: stepCount) { success, error in
//                        if success {
//                            readSteps()
//                            print("yay")
//                        } else if error != nil {
//                            fatalError("Issue during authorization: \(error?.localizedDescription)")
//                        }
//                    }
//        }
//    }
//    
//    func readStepCount(start: Date, end: Date, healthStore: HKHealthStore, completion: @escaping (Double) -> Void){
//        guard let stepQuantityType = HKQuantityType.quantityType(forIdentifier: .stepCount) else {return}
//        
//        let now = Date()
//        
//        let startOfDay = Calendar.current.startOfDay(for: now)
//        
//        let predicate = HKQuery.predicateForSamples(withStart: start, end: now, options: .strictStartDate)
//        
//        let query = HKStatisticsQuery(quantityType: stepQuantityType, quantitySamplePredicate: predicate, options: .cumulativeSum){ _, result, error in
//            
//            guard let result = result, let sum = result.sumQuantity() else{
//                completion(0.0)
//                return
//            }
//            
//            completion(sum.doubleValue(for: HKUnit.count()))
//        }
//        healthStore.execute(query)
//    }
//    
//    
//}
