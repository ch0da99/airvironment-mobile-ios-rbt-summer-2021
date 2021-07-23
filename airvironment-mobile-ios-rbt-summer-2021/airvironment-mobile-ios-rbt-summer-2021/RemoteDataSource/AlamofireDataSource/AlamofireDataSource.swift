//
//  AlamofireDataSource.swift
//  airvironment-mobile-ios-rbt-summer-2021
//
//  Created by Letnja Praksa 1 on 22.7.21..
//

import UIKit
import Alamofire

class AlamofireDataSource: RemoteDataSource {
    
    
    func getLatestMeasurement(result: @escaping ((Result<MeasurementResponse, Error>) -> Void)) {
        AF.request(Router.Meaurements.getLatestMeasurement, interceptor: nil).response { serverResponse in
            switch serverResponse.result {
            case.success(_):
                do {
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .custom(JSONDecoder.dateDecodingStrategy)
                    let responseBody: MeasurementResponse = try jsonDecoder.decode(MeasurementResponse.self, from: serverResponse.data!) as MeasurementResponse
                    result(.success(responseBody))
                } catch let error {
                    result(.failure(error))
                }
            case.failure(let error):
                result(.failure(error))
            }
        }
    }

    func getAllMeasurements(result: @escaping ((Result<Array<MeasurementResponse>, Error>) -> Void)) {
        AF.request(Router.Meaurements.getAllMeasurements, interceptor: nil).response { serverResponse in
            switch serverResponse.result {
            case.success(_):
                do {
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .custom(JSONDecoder.dateDecodingStrategy)
                    let responseBody: Measurement = try jsonDecoder.decode(Measurement.self, from: serverResponse.data!) as Measurement
                    result(.success(responseBody.response))
                } catch let error {
                    result(.failure(error))
                }
            case.failure(let error):
                result(.failure(error))
            }
        }
    }
}



