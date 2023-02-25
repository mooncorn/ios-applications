//
//  ViewController.swift
//  ConstraintsProgrammatically
//
//  Created by Daniel Carvalho on 10/02/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var vTopBlueBar : UIView!
    
    var vRedBar : UIView = ViewController.createNewView(color: .red)
    
    var vBlackBar : UIView = ViewController.createNewView(color: .black)
    
    var vOrangeBar : UIView = ViewController.createNewView(color: .orange)
    
    var vGrid : [[UIView]] = [
        [createNewView(color: .green), createNewView(color: .systemGreen)],
        [createNewView(color: .purple), createNewView(color: .systemPurple)]
    ]
    
    private static func createNewView( color : UIColor ) -> UIView {

        let view = UIView()
        view.backgroundColor = color
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.addSubview(vRedBar)
        self.view.addSubview(vBlackBar)
        self.view.addSubview(vOrangeBar)
        
        for row in vGrid{
            for col in row{
                self.view.addSubview(col)
            }
        }
        

        applyConstraints()
        
    }
    
    
    func applyConstraints() {
        
        vRedBar.leadingAnchor.constraint(equalTo: vTopBlueBar.leadingAnchor).isActive = true
        
        vRedBar.topAnchor.constraint(equalTo: vTopBlueBar.bottomAnchor, constant: 20).isActive = true
        
        vRedBar.trailingAnchor.constraint(equalTo: vTopBlueBar.trailingAnchor).isActive = true
        
        vRedBar.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        vBlackBar.leadingAnchor.constraint(equalTo: vRedBar.leadingAnchor).isActive = true
        
        vBlackBar.trailingAnchor.constraint(equalTo: vRedBar.trailingAnchor).isActive = true
        
        vBlackBar.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        vBlackBar.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        
        vOrangeBar.heightAnchor.constraint(equalToConstant: 100).isActive = true
        vOrangeBar.widthAnchor.constraint(equalToConstant: 100).isActive = true
        vOrangeBar.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        vOrangeBar.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        
        // Row 0, Col 0
        vGrid[0][0].leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        vGrid[0][0].topAnchor.constraint(equalTo: vOrangeBar.bottomAnchor, constant: 20).isActive = true
        vGrid[0][0].heightAnchor.constraint(equalToConstant: 50).isActive = true
        vGrid[0][0].widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
//        vGrid[0][0].widthAnchor.constraint(equalToConstant: self.view.centerXAnchor).isActive = true
        
    }


}

