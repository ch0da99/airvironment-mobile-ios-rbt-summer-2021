//
//  ViewUtil.swift
//  airvironment-mobile-ios-rbt-summer-2021
//
//  Created by Letnja Praksa 1 on 23.7.21..
//

import UIKit

class ViewUtils {

    static func getKeyWindow() -> UIWindow? {
        UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.makeKeyAndVisible()
        return UIApplication.shared.windows.filter {$0.isKeyWindow}.first
    }
}
