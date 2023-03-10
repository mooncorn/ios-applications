//
//  UICountdownPanel.swift
//  MIDTERM_2031317
//
//  Created by David Pilarski on 2023-03-10.
//

import UIKit

protocol UICountdownPanelDelegate {
    func countdownPanelPauseTapped( _ sender: UICountdownPanel )
    func countdownPanelPlayTapped( _ sender: UICountdownPanel )
}

class UICountdownPanel : UIView {
    /**
     Delegate that exposes this component's events.
     */
    public var delegate : UICountdownPanelDelegate?
    
    /**
    Title is the label text that is displayed above the timer.
     */
    public var title: String? {
        didSet {
            lblTitle.text = title
        }
    }
    
    /**
     Current value of timer. Change this value to reset the timer.
     */
    public var countdown: Int? {
        didSet {
            lblTime.text = String(countdown!)
            createTimer()
        }
    }
    
    private var timer: Timer?
    private var timerInterval: Double = 1.0
    
    private var lblTitle: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 17)
        lbl.textColor = .lightGray
        lbl.text = "Countdown"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private var lblTime: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 46)
        lbl.textColor = .white
        lbl.text = "0"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private var lblSeconds: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 17)
        lbl.textColor = .lightGray
        lbl.text = "seconds"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private var btnPause: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "pause.fill")
        img.tintColor = .systemGreen
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleToFill
        img.clipsToBounds = true
        return img
    }()
    
    private var btnPlay: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "play.fill")
        img.tintColor = .systemGreen
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .darkGray
        clipsToBounds = true
        
        // add subviews
        addSubview(lblTitle)
        addSubview(lblTime)
        addSubview(lblSeconds)
        addSubview(btnPause)
        addSubview(btnPlay)
        
        // apply constraints
        applyConstraints()
        
        // connect action listeners
        btnPlay.enableTapGestureRecognizer(target: self, action: #selector(playButtonTapped))
        btnPause.enableTapGestureRecognizer(target: self, action: #selector(pauseButtonTapped))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyConstraints() {
        lblTitle.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        lblTitle.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        lblTitle.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        
        lblTime.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        lblTime.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        lblTime.topAnchor.constraint(equalTo: lblTitle.bottomAnchor).isActive = true
        
        lblSeconds.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        lblSeconds.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        lblSeconds.topAnchor.constraint(equalTo: lblTime.bottomAnchor).isActive = true
        
        btnPause.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        btnPause.bottomAnchor.constraint(equalTo: lblSeconds.bottomAnchor, constant: 3).isActive = true
        btnPause.heightAnchor.constraint(equalToConstant: 23).isActive = true
        btnPause.widthAnchor.constraint(equalToConstant: 23).isActive = true
        
        btnPlay.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        btnPlay.bottomAnchor.constraint(equalTo: lblSeconds.bottomAnchor, constant: 3).isActive = true
        btnPlay.heightAnchor.constraint(equalToConstant: 23).isActive = true
        btnPlay.widthAnchor.constraint(equalToConstant: 23).isActive = true
    }
    
    @objc private func playButtonTapped() {
        if timer?.isValid == false {
            createTimer()
        }
        delegate?.countdownPanelPlayTapped(self)
    }
    
    @objc private func pauseButtonTapped() {
        if timer?.isValid == true {
            timer?.invalidate()
        }
        delegate?.countdownPanelPauseTapped(self)
    }
    
    @objc private func updateCounter() {
        if countdown! > 0 {
            countdown! -= 1
            lblTime.text = String(countdown!)
        } else {
            timer?.invalidate()
        }
    }
    
    private func createTimer() {
        timer = Timer.scheduledTimer(timeInterval: timerInterval, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: false)
    }
}
