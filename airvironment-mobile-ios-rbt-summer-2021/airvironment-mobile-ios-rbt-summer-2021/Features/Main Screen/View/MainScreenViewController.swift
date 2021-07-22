//
//  MainScreenViewController.swift
//  airvironment-mobile-ios-rbt-summer-2021
//
//  Created by Letnja Praksa 1 on 22.7.21..
//

import UIKit

class MainScreenViewController: UIViewController {
    
    @IBOutlet weak var lastUpdatedLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var polutionLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    private var nameObserver: NSKeyValueObservation!
    
    private let viewModel: MainScreenViewModel = MainScreenViewModel(repository: RepositoryImplementation())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        observeLiveData()
        viewModel.onViewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func observeLiveData() {
        nameObserver = viewModel.observe(\.measurement, options: .new) { _, measurement  in
            if let measurement = measurement.newValue{
                self.temperatureLabel.text = String(measurement!.temperature!)
                self.humidityLabel.text = String(measurement!.humidity!)
                self.polutionLabel.text = String(measurement!.pollution!)
            }

        }
    }
    
    @IBAction func onButtonTapped(_ sender: UIButton) {
        navigationController!.show(HistoryScreenViewController(), sender: nil)
        
    }
    
    

}
