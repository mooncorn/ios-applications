//
//  enableTapGestureRecognizer.swift
//  Superhero
//
//  Created by David Pilarski on 2023-04-03.
//

import UIKit

extension UIView {
    func enableTapGestureRecognizer(target: Any?, action: Selector?){
        let tapGestureRecognizer = UITapGestureRecognizer(target: target, action: action)
        self.addGestureRecognizer(tapGestureRecognizer)
        self.isUserInteractionEnabled = true
    }
}
