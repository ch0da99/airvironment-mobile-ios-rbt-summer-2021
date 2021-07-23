//
//  HistoryScreenViewModel.swift
//  airvironment-mobile-ios-rbt-summer-2021
//
//  Created by Letnja Praksa 1 on 22.7.21..
//

import Foundation

class HistoryScreenViewModel: BaseViewModel {
    
    var repository: Repository!
    @objc dynamic var measurements: Array<MeasurementResponse>?
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    override func onViewDidLoad() {
        super.onViewDidLoad()
        getAllMeasurements()
    }
    
    private func getAllMeasurements() {
        self.loading = true
        repository.getAllMeasurements() { result in
            switch result {
            case.success(let measurements):
                self.measurements = measurements
                self.loading = false
            case.failure(let error):
                self.loading = false
            }
            
        }
    }
    
    
}
