//
//  HistoryScreenViewController.swift
//  airvironment-mobile-ios-rbt-summer-2021
//
//  Created by Letnja Praksa 1 on 23.7.21..
//

import UIKit

class HistoryScreenViewController: BaseViewController<HistoryScreenViewModel> {

    @IBOutlet weak var historyTableView: UITableView!
    
    private var observer: NSKeyValueObservation!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = HistoryScreenViewModel(repository: RepositoryImplementation())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTableView.register(UINib(nibName: HistoryScreenViewCellTableViewCell.reusableIdentifier(), bundle: nil), forCellReuseIdentifier: HistoryScreenViewCellTableViewCell.reusableIdentifier())
    }
    
    override func observeLiveData() {
        super.observeLiveData()
        observer = viewModel.observe(\.measurements, options: .new) { _, measurements  in
            if let measurements = measurements.newValue {
                self.historyTableView.dataSource = self
            }
        }
    }
}


extension HistoryScreenViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.measurements!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryScreenViewCellTableViewCell.reusableIdentifier(), for: indexPath) as! HistoryScreenViewCellTableViewCell
        if let measurements = viewModel.measurements {
            cell.configure(measurement: measurements[indexPath.row])
        }
        
        return cell
    }
}

