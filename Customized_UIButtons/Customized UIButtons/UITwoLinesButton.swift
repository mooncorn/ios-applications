//
//  UITwoLinesButton.swift
//  Customized UIButtons
//
//  Created by Daniel Carvalho on 03/02/23.
//

import UIKit


class UITwoLinesButton : UIButton {
    
    /*
     
     |---------------------|
     |  firstLine (label)  |
     |  secondLine (label) |
     |---------------------|
     
     */
    
    private let lblFirstLine : UILabel = {
        
        let lbl = UILabel()
        lbl.numberOfLines = 1
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.font = .systemFont(ofSize: 26, weight: .semibold)
        return lbl
        
    }()

    private let lblSecondLine : UILabel = {
        
        let lbl = UILabel()
        lbl.numberOfLines = 2
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.font = .systemFont(ofSize: 13, weight: .regular)
        return lbl
        
    }()
    
    public var firstLineText : String? {
        didSet{
            lblFirstLine.text = firstLineText
        }
    }

    public var secondLineText : String? {
        didSet{
            lblSecondLine.text = secondLineText
        }
    }
    
    public var background : UIColor? {
        didSet{
            backgroundColor = background
        }
    }
    
    public var onTapBackground : UIColor?
        
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(lblFirstLine)
        addSubview(lblSecondLine)
        
        layer.borderWidth = 1
        layer.cornerRadius = 10
        layer.borderColor = UIColor.secondarySystemBackground.cgColor
        
        clipsToBounds = true
        
        addTarget(self, action: #selector(btnTouchedUpInside), for: .touchUpInside)
        
    }
    
    
    @objc func btnTouchedUpInside(){
        
        backgroundColor = onTapBackground
        
    }
    
    
    required init?(coder: NSCoder) {
        // used for storyboard... we don't need to implement
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // set the position/size for our subviews (labels)
        lblFirstLine.frame = CGRect(x: 5, y: 5, width: frame.size.width-10.0, height: (frame.size.height-10.0) / 2)

        lblSecondLine.frame = CGRect(x: 5, y: 5+((frame.size.height-10.0) / 2), width: frame.size.width-10.0, height: (frame.size.height-10.0) / 2)
        
        
    }
    

    
}
