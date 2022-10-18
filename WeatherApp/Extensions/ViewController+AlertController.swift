//
//  ViewController+AlertController.swift
//  WeatherApp
//
//  Created by Илья on 09.10.2022.
//

import UIKit

extension MainWeatherViewController {
    func presentAlertController(withTitle title: String?,
                                message: String?,
                                style: UIAlertController.Style,
                                completionHandler: @escaping (String) -> Void) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        alertController.addTextField { tf in
            let cities = ["Moscow", "Baku", "Stambul", "New York", "San Francisco"]
            tf.placeholder = cities.randomElement()
        }
        
        let search = UIAlertAction(title: "Search", style: .default) { action in
            let textField = alertController.textFields?.first
            
            guard let cityName = textField?.text else { return }
            
            if cityName != "" {
                print("search info for the \(cityName)")
                let city = cityName.split(separator: " ").joined(separator: "%20")
                completionHandler(city)
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(search)
        alertController.addAction(cancel)
        
        present(alertController, animated: true, completion: nil)
    }
}
