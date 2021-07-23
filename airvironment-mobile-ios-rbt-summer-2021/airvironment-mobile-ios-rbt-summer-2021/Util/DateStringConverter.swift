//
//  DateStringConverter.swift
//  airvironment-mobile-ios-rbt-summer-2021
//
//  Created by Letnja Praksa 1 on 23.7.21..
//

import Foundation

func dateToString(date: Date) -> String?{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "YY/MM/dd HH:mm:ss"
    
    return dateFormatter.string(from: date)
}
