//
//  MainScreenViewModel.swift
//  airvironment-mobile-ios-rbt-summer-2021
//
//  Created by Letnja Praksa 1 on 22.7.21..
//

import UIKit

class MainScreenViewModel: BaseViewModel  {
    
    @objc dynamic var measurement: MeasurementResponse?
    
    var repository: Repository!
    
    var timer: Timer!
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    override func onViewDidLoad() {
        super.onViewDidLoad()
        getLatestMeasuremet()
        self.timer = Timer.scheduledTimer(timeInterval: 600.0,target: self, selector:
                #selector(getLatestMeasuremet), userInfo: nil, repeats: true)
    }
    
    @objc func getLatestMeasuremet() {
        //print(Date.init())
        self.loading = true
        repository.getLatestMeasurement(){ result in
            switch result {
            case.success(let measurement):
                self.measurement = measurement
                self.loading = false
            case.failure(let error):
                self.loading = false
                break
            }
            
        }
        
    }
}
