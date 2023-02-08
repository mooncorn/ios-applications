//
//  ViewController.swift
//  Customized UIButtons
//
//  Created by Daniel Carvalho on 03/02/23.
//

import UIKit

class ViewController: UIViewController {

    var btnTwoLinesButton : UITwoLinesButton?
    var btnIconedButton : IconedButton?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        btnTwoLinesButton = UITwoLinesButton(frame: CGRect(x: 20, y: 100, width: 300, height: 100))
        btnIconedButton = IconedButton(frame: CGRect(x: 20, y: 220, width: 200, height: 60))
        

        btnTwoLinesButton!.background = .red
        btnTwoLinesButton!.onTapBackground = .black
        btnTwoLinesButton!.firstLineText = "This is the first line"
        btnTwoLinesButton!.secondLineText = "This is the second line, where you can add more text"
        
        btnIconedButton!.text = "hellooo"
        btnIconedButton!.icon = UIImage.init(systemName: "xmark")
        btnIconedButton!.bgColor = .blue
        btnIconedButton!.bgColorOnHold = .red
        
        self.view.addSubview(btnTwoLinesButton!)
        self.view.addSubview(btnIconedButton!)
    }
}

