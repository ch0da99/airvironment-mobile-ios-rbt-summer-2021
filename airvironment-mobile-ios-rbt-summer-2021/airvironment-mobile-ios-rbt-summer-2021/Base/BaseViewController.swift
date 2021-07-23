//
//  BaseViewController.swift
//  airvironment-mobile-ios-rbt-summer-2021
//
//  Created by Letnja Praksa 1 on 23.7.21..
//

import UIKit

class BaseViewController<T: BaseViewModel>: UIViewController {
    var viewModel: T!
    var loader: LoadOverlay = LoadOverlay()
    private var observer: NSKeyValueObservation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeLiveData()
        viewModel.onViewDidLoad()
    }
    
    open func observeLiveData() {
        observer = viewModel.observe(\.loading, options: .new) {
            _, loading in
            if let loading = loading.newValue{
                if loading == true {
                    self.loader.show()
                }
                else{
                    self.loader.hide()
                }
            }
        }
    }
}
