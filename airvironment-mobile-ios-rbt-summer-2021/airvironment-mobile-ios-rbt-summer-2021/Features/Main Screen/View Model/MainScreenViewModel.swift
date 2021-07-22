//
//  MainScreenViewModel.swift
//  airvironment-mobile-ios-rbt-summer-2021
//
//  Created by Letnja Praksa 1 on 22.7.21..
//

import UIKit

class MainScreenViewModel: NSObject  {
    
    @objc dynamic var measurement: MeasurementResponse?
    
    var repository: Repository!
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func onViewDidLoad() {
        getLatestMeasuremet()
    }
    
    func getLatestMeasuremet() {
        repository.getLatestMeasurement(){ result in
            switch result {
            case.success(let measurement):
                self.measurement = measurement
            case.failure(let error):
                break
            }
            
        }
    }
}
