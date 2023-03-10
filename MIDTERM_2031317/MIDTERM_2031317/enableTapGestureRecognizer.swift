//
//  enableTapGestureRecognizer.swift
//  MIDTERM_2031317
//
//  Created by David Pilarski on 2023-03-10.
//

import UIKit

extension UIView {
    func enableTapGestureRecognizer(target: Any?, action: Selector?){
        let tapGestureRecognizer = UITapGestureRecognizer(target: target, action: action)
        self.addGestureRecognizer(tapGestureRecognizer)
        self.isUserInteractionEnabled = true
    }
}
