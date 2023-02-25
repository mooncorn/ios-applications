//
//  UIView_enableTapGestureRecognizer.swift
//  IOS2-Mapkit
//
//  Created by Daniel Carvalho on 15/02/23.
//

import UIKit

extension UIView {
    
    func enableTapGestureRecognizer(target: Any?, action: Selector?){
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: target, action: action)
        self.addGestureRecognizer(tapGestureRecognizer)
        self.isUserInteractionEnabled = true
        
    }
    
}
