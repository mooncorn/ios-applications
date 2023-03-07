//
//  ViewController.swift
//  IOS2-Mapkit
//
//  Created by Daniel Carvalho on 15/02/23.
//

import UIKit

class ViewController: UIViewController, UICoordinatePanelDelegate {

    var addressPanel : UIAddressPanel = UIAddressPanel()
    var coordinatePanel : UICoordinatePanel = UICoordinatePanel()
    var weatherPanel : UIWeatherPanel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubviews(addressPanel, coordinatePanel)
        
        applyConstraints()
        
        addressPanel.backgroundColor = .blue.withAlphaComponent(0.3)
        addressPanel.userImage = UIImage(systemName: "xmark")
        addressPanel.address = "1696 Dezery St, H1W 2R7, Montreal, Canada"
        
        coordinatePanel.coordinateImage = UIImage(systemName: "target")
        coordinatePanel.backgroundColor = .red.withAlphaComponent(0.3)
        coordinatePanel.latitude = 0.0
        coordinatePanel.longitude = 0.0
        

        
        coordinatePanel.delegate = self
    }
    
    func applyConstraints() {
        addressPanel.translatesAutoresizingMaskIntoConstraints = false
        addressPanel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        addressPanel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        addressPanel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        addressPanel.heightAnchor.constraint(equalToConstant: 100).isActive = true

        coordinatePanel.translatesAutoresizingMaskIntoConstraints = false
        coordinatePanel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        coordinatePanel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        coordinatePanel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        coordinatePanel.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func coordinatePanelButtonTaped(_ sender: Any?) {
        
        weatherPanel = UIWeatherPanel()
        view.addSubview(weatherPanel!)
        
        weatherPanel!.backgroundColor = .green.withAlphaComponent(0.3)
        weatherPanel!.image = UIImage(systemName: "sun.min.fill")?.withTintColor(.systemYellow, renderingMode: .alwaysOriginal)
        weatherPanel!.temperature = "2"
        weatherPanel!.condition = "Sunny"
        weatherPanel!.feelsLike = "3"
        weatherPanel!.secondsShowingPanel = 4
        
        weatherPanel!.translatesAutoresizingMaskIntoConstraints = false
        weatherPanel!.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5).isActive = true
        weatherPanel!.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 105).isActive = true
        weatherPanel!.widthAnchor.constraint(equalToConstant: 120).isActive = true
        weatherPanel!.heightAnchor.constraint(equalToConstant: 280).isActive = true
        
    }
}

