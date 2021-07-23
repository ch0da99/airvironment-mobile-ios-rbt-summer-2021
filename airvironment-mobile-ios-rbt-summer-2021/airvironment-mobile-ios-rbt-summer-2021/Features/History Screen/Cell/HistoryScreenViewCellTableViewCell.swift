//
//  HistoryScreenViewCellTableViewCell.swift
//  airvironment-mobile-ios-rbt-summer-2021
//
//  Created by Letnja Praksa 1 on 22.7.21..
//

import UIKit
import Kingfisher

class HistoryScreenViewCellTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var pollutionLabel: UILabel!
    
    @IBOutlet weak var humidityLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(measurement: MeasurementResponse){
        temperatureLabel.text = String(measurement.temperature)
        humidityLabel.text = String(measurement.humidity)
        pollutionLabel.text = String(measurement.pollution)
    }
    
}

extension UITableViewCell {
    static func reusableIdentifier() -> String {
        String(describing: Self.self)
    }
}
