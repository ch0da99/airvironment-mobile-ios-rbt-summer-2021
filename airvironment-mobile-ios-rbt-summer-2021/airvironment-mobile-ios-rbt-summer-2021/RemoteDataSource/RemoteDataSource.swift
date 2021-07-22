//
//  RemoteDataSource.swift
//  airvironment-mobile-ios-rbt-summer-2021
//
//  Created by Letnja Praksa 1 on 22.7.21..
//

import UIKit

protocol RemoteDataSource {
    
    func getLatestMeasurement(result: @escaping ((Result<MeasurementResponse, Error>) -> Void))
    
    func getAllMeasurements(result: @escaping ((Result<Array<MeasurementResponse>, Error>) -> Void))

}
