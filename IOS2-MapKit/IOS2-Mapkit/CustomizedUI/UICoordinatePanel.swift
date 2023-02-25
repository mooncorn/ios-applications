//
//  UICoordinatePanel.swift
//  IOS2-Mapkit
//
//  Created by David Pilarski on 2023-02-25.
//

import UIKit

protocol UICoordinatePanelDelegate {
    func coordinatePanelButtonTaped(_ sender: Any?)
}

class UICoordinatePanel : UIView {
    
    var delegate : UICoordinatePanelDelegate?
    
    private let lblLatitudeHeading : UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 1
        lbl.textColor = .black
        lbl.text = "Latitude"
        lbl.font = .systemFont(ofSize: 12)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let lblLatitude : UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 1
        lbl.textColor = .black
        lbl.font = .systemFont(ofSize: 16, weight: .bold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let lblLongitudeHeading : UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 1
        lbl.textColor = .black
        lbl.text = "Longitude"
        lbl.font = .systemFont(ofSize: 12)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let lblLongitude : UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 1
        lbl.textColor = .black
        lbl.font = .systemFont(ofSize: 16, weight: .bold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let btnCoordinate : UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.tintColor = .white
        img.clipsToBounds = true
        img.tintColor = .black
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    public var latitude : Double? {
        didSet {
            if latitude != nil {
                lblLatitude.text = String(latitude!)
            }
        }
    }
    
    public var coordinateImage : UIImage? {
        didSet{
            btnCoordinate.image = coordinateImage
        }
    }
    
    public var longitude : Double? {
        didSet {
            if longitude == nil {
                lblLongitude.text = ""
            } else {
                lblLongitude.text = String(longitude!)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
        
        addSubview(lblLatitudeHeading)
        addSubview(lblLatitude)
        addSubview(lblLongitudeHeading)
        addSubview(lblLongitude)
        addSubview(btnCoordinate)
        
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        lblLatitudeHeading.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        lblLatitudeHeading.widthAnchor.constraint(equalToConstant: 150).isActive = true
        lblLatitudeHeading.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        lblLatitudeHeading.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        lblLatitude.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        lblLatitude.widthAnchor.constraint(equalToConstant: 150).isActive = true
        lblLatitude.topAnchor.constraint(equalTo: lblLatitudeHeading.bottomAnchor).isActive = true
        lblLatitude.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        lblLongitudeHeading.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 160).isActive = true
        lblLongitudeHeading.widthAnchor.constraint(equalToConstant: 150).isActive = true
        lblLongitudeHeading.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        lblLongitudeHeading.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        lblLongitude.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 160).isActive = true
        lblLongitude.widthAnchor.constraint(equalToConstant: 150).isActive = true
        lblLongitude.topAnchor.constraint(equalTo: lblLatitudeHeading.bottomAnchor).isActive = true
        lblLongitude.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        btnCoordinate.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        btnCoordinate.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 7.5).isActive = true
        btnCoordinate.heightAnchor.constraint(equalToConstant: 25).isActive = true
        btnCoordinate.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        btnCoordinate.enableTapGestureRecognizer(target: self, action: #selector(btnTapped))
    }
    
    @objc func btnTapped() {
        if delegate != nil {
            delegate!.coordinatePanelButtonTaped(self)
        }
    }
}
