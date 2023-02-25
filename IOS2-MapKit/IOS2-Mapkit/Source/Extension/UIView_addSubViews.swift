//
//  UIView_addSubViews.swift
//  IOS2-Mapkit
//
//  Created by Daniel Carvalho on 15/02/23.
//

import UIKit

extension UIView{
    
    // Variadic function
    func addSubviews( _ views : UIView... ) {
        
        for view in views {
            self.addSubview(view)
        }
        
    }
    
}
