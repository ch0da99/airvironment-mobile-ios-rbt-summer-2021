//
//  Measurement.swift
//  airvironment-mobile-ios-rbt-summer-2021
//
//  Created by Letnja Praksa 1 on 22.7.21..
//

import Foundation

class Measurement: NSObject, Codable{
    var meta: Meta!
    var response: Array<MeasurementResponse>!
    
    init(Meta: Meta, measurementResponse: Array<MeasurementResponse>) {
        self.meta = Meta
        self.response = measurementResponse
    }
    
    enum CodingKeys: String, CodingKey {
        case meta
        case response
    }
}
