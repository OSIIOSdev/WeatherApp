//
//  ViewController.swift
//  WeatherApp
//
//  Created by Илья on 09.10.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var weatherIconImageView: UIImageView!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var feelsLiketemperatureLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        self.presentAlertController(withTitle: "Enter city name", message: nil, style: .alert)
    }
    

}

