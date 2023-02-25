//
//  UIAddressPanel.swift
//  IOS2_MapKit
//
//  Created by Manlika Throngsiriwat on 2023-02-17.
//

import UIKit

protocol UIAddressPanelDelegate {
    
    func addressPanelCloseButtonTapped( _ sender : Any? )
    
    /* Steps for the protocol
       
     Inside your CustomizedUI
       1. Define the protocol (function signatures)
       2. Create the protocol as an optional delegate var
       3. Check if delegate is != nil (somebody is listening) before calling those methods.
     
     ViewController (using your customized UI)
       1. Invoke the protocol (declare the protocol after the subclass).
       2. Link "self" to the object delegate attribute (ex: addressPanel.delegate = self)
       3. Implement the stubs (mandatory/optional functions that you need to comunicate).
     
     */
    
    
}


class UIAddressPanel : UIView {
    
    var delegate : UIAddressPanelDelegate?
    
    private let lblAddress : UILabel = {
        
        let lbl = UILabel()
        lbl.numberOfLines = 1
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 16)
        lbl.backgroundColor = .gray.withAlphaComponent(0)
        lbl.translatesAutoresizingMaskIntoConstraints = false

        return lbl
    }()
    
    private let imageIcon : UIImageView = {
        
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.tintColor = .white
        img.clipsToBounds = true
        img.tintColor = .black
        img.translatesAutoresizingMaskIntoConstraints = false
        
        return img
    }()
    
    public var userImage : UIImage? {
        didSet{
            imageIcon.image = userImage
        }
    }
    
    public var address : String? {
        didSet{
            lblAddress.text = address
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // adding subviews
        addSubview(imageIcon)
        addSubview(lblAddress)
        
        clipsToBounds = true //To prevent labels to go outside of the container
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        lblAddress.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        lblAddress.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        lblAddress.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        lblAddress.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        imageIcon.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        imageIcon.bottomAnchor.constraint(equalTo: lblAddress.topAnchor).isActive = true
        imageIcon.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageIcon.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        imageIcon.enableTapGestureRecognizer(target: self, action: #selector(imageTapped))
         
    }
    
    @objc func imageTapped(){
        
        if delegate != nil {
            delegate!.addressPanelCloseButtonTapped(self)
        }
    }
    
    
}
