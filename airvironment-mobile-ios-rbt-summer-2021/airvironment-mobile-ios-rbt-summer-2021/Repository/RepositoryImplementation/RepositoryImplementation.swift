//
//  RepositoryImplementation.swift
//  airvironment-mobile-ios-rbt-summer-2021
//
//  Created by Letnja Praksa 1 on 22.7.21..
//

import Foundation

class RepositoryImplementation: Repository {
    
    var webRemoteDataSource: RemoteDataSource = AlamofireDataSource()
    
    func getLatestMeasurement(result: @escaping ((Result<MeasurementResponse, Error>) -> Void)) {
        webRemoteDataSource.getLatestMeasurement(result: result)
    }
    
    func getAllMeasurements(result: @escaping ((Result<Array<MeasurementResponse>, Error>) -> Void)) {
        webRemoteDataSource.getAllMeasurements(result: result)
    }
    
}

