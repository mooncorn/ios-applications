//
//  ViewController.swift
//  MIDTERM_2031317
//
//  Created by David Pilarski on 2023-03-10.
//

import UIKit

class ViewController: UIViewController, UICountdownPanelDelegate {
    func countdownPanelPauseTapped(_ sender: UICountdownPanel) {
        print("pause button clicked")
    }
    
    func countdownPanelPlayTapped(_ sender: UICountdownPanel) {
        print("play button clicked")
    }
    

    var countdownPanel : UICountdownPanel = UICountdownPanel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(countdownPanel)
        
        countdownPanel.translatesAutoresizingMaskIntoConstraints = false
        countdownPanel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        countdownPanel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        countdownPanel.heightAnchor.constraint(equalToConstant: 140).isActive = true
        countdownPanel.widthAnchor.constraint(equalToConstant: 270).isActive = true
        
        countdownPanel.countdown = 10
        countdownPanel.title = "Countdown"
        countdownPanel.delegate = self
    }
}

