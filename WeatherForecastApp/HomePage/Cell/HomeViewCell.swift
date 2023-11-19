//
//  HomeViewCell.swift
//  WeatherForecastApp
//
//  Created by Emine CETINKAYA on 19.11.2023.
//

import UIKit

class HomeViewCell: UITableViewCell {

    
    @IBOutlet weak var dayLbl: UILabel!
    
    @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var dgLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
