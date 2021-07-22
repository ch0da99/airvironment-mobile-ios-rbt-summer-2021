//
//  Router.swift
//  airvironment-mobile-ios-rbt-summer-2021
//
//  Created by Letnja Praksa 1 on 22.7.21..
//

import Foundation
import Alamofire

struct Router {
    
    public static var baseUrl: URL = URL(string: "https://airvironment.live")!
    
    enum Meaurements: URLRequestConvertible {
        case getLatestMeasurement
        case getAllMeasurements
        
        var resource: String {
            switch self {
            case .getLatestMeasurement: return "/api/measurements/latest"
            case .getAllMeasurements: return "/api/measurements"
            }
        }
        
        var method: HTTPMethod {
            switch self {
            case .getLatestMeasurement: return .get
            case .getAllMeasurements: return .get
            }
        }
        
        var path: String {
            switch self {
            case .getLatestMeasurement: return resource
            case .getAllMeasurements: return resource
            }
        }
        
        func asURLRequest() throws -> URLRequest {
            var request = URLRequest(url: baseUrl.appendingPathComponent(path))
            request.method = method

            switch self {
            case .getLatestMeasurement:
                break
            case .getAllMeasurements:
                break
            }
            
            return request
        }
    }
}
