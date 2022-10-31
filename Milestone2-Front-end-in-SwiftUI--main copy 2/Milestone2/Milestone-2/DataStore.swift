//
//  DataStore.swift
//  Instagram-app
//
//  Created by Shikha Charadva on 10/30/22.
//

import Foundation
import HealthKit

final class DataStore: ObservableObject {
    
    @Published var steps: Double = 0.0
    
    func authorizeHealthKit() {
        
        HealthKitSetupAssistant.authorizeHealthKit { (authorized, error) in
            
            guard authorized else {
                
                let baseMessage = "HealthKit Authorization Failed"
                
                if let error = error {
                    print("\(baseMessage). Reason: \(error.localizedDescription)")
                } else {
                    print(baseMessage)
                }
                
                return
            }
            
            print("HealthKit Successfully Authorized.")
        }
        
    }
}
