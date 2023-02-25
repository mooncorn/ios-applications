//
//  UIWeatherPanel.swift
//  IOS2-Mapkit
//
//  Created by David Pilarski on 2023-02-25.
//

import UIKit

class UIWeatherPanel : UIView {
    
    private let imageViewWeather : UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.tintColor = .white
        img.clipsToBounds = true
        img.tintColor = .black
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private let lblTemperature : UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 1
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 42, weight: .bold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let lblCondition : UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 1
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let lblFeelsLike : UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 1
        lbl.textColor = .black
        lbl.font = .systemFont(ofSize: 20, weight: .bold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let lblFeelsLikeHeading : UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 2
        lbl.textColor = .black
        lbl.text = "feels\nlike"
        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 14)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var image : UIImage? {
        didSet {
            imageViewWeather.image = image
        }
    }
    
    var temperature : String? {
        didSet {
            lblTemperature.text = temperature
        }
    }
    
    var condition : String? {
        didSet {
            lblCondition.text = condition
        }
    }
    
    var feelsLike : String? {
        didSet {
            lblFeelsLike.text = feelsLike
        }
    }
    
    var secondsShowingPanel : Int? {
        didSet {
            perform(#selector(close), with: nil, afterDelay: Double(secondsShowingPanel!))
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageViewWeather)
        addSubview(lblTemperature)
        addSubview(lblCondition)
        addSubview(lblFeelsLikeHeading)
        addSubview(lblFeelsLike)
        
        self.layer.cornerRadius = 15
        
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageViewWeather.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        imageViewWeather.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: frame.width/2-30).isActive = true
        imageViewWeather.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageViewWeather.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        lblTemperature.widthAnchor.constraint(equalToConstant: 40).isActive = true
        lblTemperature.heightAnchor.constraint(equalToConstant: 40).isActive = true
        lblTemperature.topAnchor.constraint(equalTo: imageViewWeather.bottomAnchor, constant: 20).isActive = true
        lblTemperature.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: frame.width/2-20).isActive = true
        
        lblCondition.heightAnchor.constraint(equalToConstant: 30).isActive = true
        lblCondition.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        lblCondition.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        lblCondition.topAnchor.constraint(equalTo: lblTemperature.bottomAnchor, constant: 20).isActive = true
        
        lblFeelsLikeHeading.widthAnchor.constraint(equalToConstant: 40).isActive = true
        lblFeelsLikeHeading.trailingAnchor.constraint(equalTo: self.leadingAnchor, constant: frame.width/2-10).isActive = true
        lblFeelsLikeHeading.topAnchor.constraint(equalTo: lblCondition.bottomAnchor, constant: 20).isActive = true
        lblFeelsLikeHeading.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        lblFeelsLike.widthAnchor.constraint(equalToConstant: 40).isActive = true
        lblFeelsLike.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: frame.width/2+10).isActive = true
        lblFeelsLike.topAnchor.constraint(equalTo: lblCondition.bottomAnchor, constant: 20).isActive = true
        lblFeelsLike.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    @objc func close() {
        let scaledAndTranslatedTransform = self.transform.translatedBy(x: -200, y: 0)
        UIView.animate(withDuration: 0.7, animations: {
            self.transform = scaledAndTranslatedTransform
        }, completion: { (finished: Bool) in
            if finished {
                self.removeFromSuperview()
            }
        })
    }
}
