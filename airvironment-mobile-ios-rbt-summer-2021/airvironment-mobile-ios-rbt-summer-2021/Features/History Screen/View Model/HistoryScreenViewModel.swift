//
//  HistoryScreenViewModel.swift
//  airvironment-mobile-ios-rbt-summer-2021
//
//  Created by Letnja Praksa 1 on 22.7.21..
//

import Foundation

class HistoryScreenViewModel: NSObject {
    
    var repository: Repository!
    @objc dynamic var measurements: Array<MeasurementResponse>?
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func onViewDidLoad() {
        getAllMeasurements()
    }
    
    private func getAllMeasurements() {
        repository.getAllMeasurements() { result in
            switch result {
            case.success(let measurements):
                self.measurements = measurements
            case.failure(let error):
                break
            }
            
        }
    }
    
    
}
