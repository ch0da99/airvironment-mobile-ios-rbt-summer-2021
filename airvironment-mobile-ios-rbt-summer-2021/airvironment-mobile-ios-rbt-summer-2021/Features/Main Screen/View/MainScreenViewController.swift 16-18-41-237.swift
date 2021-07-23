//
//  MainScreenViewController.swift
//  airvironment-mobile-ios-rbt-summer-2021
//
//  Created by Letnja Praksa 1 on 22.7.21..
//

import UIKit

class MainScreenViewController: BaseViewController<MainScreenViewModel> {
    
    @IBOutlet weak var lastUpdatedLabel: UILabel!
   
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var polutionLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    private var measurementObserver: NSKeyValueObservation!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = MainScreenViewModel(repository: RepositoryImplementation())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit {
        viewModel.timer.invalidate()
        viewModel.timer = nil
    }
    
    override func observeLiveData() {
        super.observeLiveData()
        measurementObserver = viewModel.observe(\.measurement, options: .new) { _, measurement  in
            if let measurement = measurement.newValue{
                self.temperatureLabel.text = String(measurement!.temperature!)
                self.humidityLabel.text = String(measurement!.humidity!)
                self.polutionLabel.text = String(measurement!.pollution!)
                if let date = dateToString(date: measurement!.created) {
                    self.lastUpdatedLabel.text = "Last updated " + date
                }
            }
            

        }
    }
    
    @IBAction func onButtonTapped(_ sender: UIButton) {
        navigationController!.show(HistoryScreenViewController(), sender: nil)
        
    }
    
    

}
