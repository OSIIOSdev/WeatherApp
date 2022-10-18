//
//  ViewController.swift
//  WeatherApp
//
//  Created by Илья on 09.10.2022.
//

import UIKit

class MainWeatherViewController: UIViewController {
    @IBOutlet var weatherIconImageView: UIImageView!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var feelsLiketemperatureLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchWeather(forCity: "London")
    }
    
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        self.presentAlertController(withTitle: "Enter city name", message: nil, style: .alert) {city in
            self.fetchWeather(forCity: city)
        }
    }
}

extension MainWeatherViewController {
    private func fetchWeather(forCity city: String) {
        let link = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=42af8dbee5c1cd67ca5889cdce4ad6f1"
        guard let url = URL(string: link) else { return }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let weather = try JSONDecoder().decode(CurrentWeatherData.self, from: data)
                print(weather)
            } catch {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }
}

