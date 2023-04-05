//
//  UIView_addSubViews.swift
//  Superhero
//
//  Created by David Pilarski on 2023-04-04.
//

import UIKit

extension UIView{
    func addSubviews( _ views : UIView... ) {
        for view in views {
            self.addSubview(view)
        }
    }
}
