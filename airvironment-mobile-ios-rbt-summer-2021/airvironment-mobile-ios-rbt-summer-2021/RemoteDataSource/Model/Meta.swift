//
//  MeasurementMeta.swift
//  airvironment-mobile-ios-rbt-summer-2021
//
//  Created by Letnja Praksa 1 on 22.7.21..
//

import Foundation

class Meta: NSObject, Codable {
    var total:Int!
    var page:Int!
    var perPage:Int!
    
    init(total: Int, page: Int, perPage: Int) {
        self.total = total
        self.page = page
        self.perPage = perPage
    }
    
    enum CodingKeys: String, CodingKey {
        case total
        case page
        case perPage = "per_page"
    }
}
