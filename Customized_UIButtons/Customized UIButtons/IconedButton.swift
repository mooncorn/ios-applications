//
//  IconedButton.swift
//  Customized UIButtons
//
//  Created by english on 2023-02-08.
//

import UIKit

class IconedButton : UIButton {
    
    private let lblText : UILabel = {
        
        let lbl = UILabel()
        lbl.numberOfLines = 1
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.font = .systemFont(ofSize: 26, weight: .semibold)
        return lbl
        
    }()
    
    private let imageViewIcon : UIImageView = {
        
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
        
    }()
    
    public var text : String? {
        didSet{
            lblText.text = text
        }
    }
    
    public var icon : UIImage? {
        didSet{
            imageViewIcon.image = icon
        }
    }
    
    public var bgColor : UIColor? {
        didSet{
            self.backgroundColor = bgColor
        }
    }
    
    public var bgColorOnHold : UIColor?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageViewIcon)
        addSubview(lblText)
        
        layer.borderWidth = 1
        layer.cornerRadius = 10
        layer.borderColor = UIColor.secondarySystemBackground.cgColor
        
        clipsToBounds = true
        
        addTarget(self, action: #selector(btnTouchDown), for: .touchDown)
        addTarget(self, action: #selector(btnTouchUpInside), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func btnTouchDown() {
        backgroundColor = bgColorOnHold
    }
    
    @objc func btnTouchUpInside() {
        backgroundColor = bgColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // set the position/size for our subviews (labels)
        imageViewIcon.frame = CGRect(x: 15, y: frame.size.height/2-15, width: 30, height: 30)

        lblText.frame = CGRect(x: 60 , y: frame.size.height/2-15, width: frame.size.width-75, height: 26)
    }
}
