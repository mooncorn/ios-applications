//
//  CustomTableViewCell.swift
//  Superhero
//
//  Created by David Pilarski on 2023-03-31.
//

import UIKit

class ListViewCellUI : UITableViewCell {
    
    var headingText : String = "" {
        didSet {
            lblHeading.text = headingText
        }
    }
    
    var imgUrl : String = "" {
        didSet {
            imgHero.load(url: URL(string: imgUrl)!)
        }
    }
    
    var subtext : String = "" {
        didSet {
            lblSubtext.text = subtext
        }
    }
    
    let imgHero : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleToFill
        img.clipsToBounds = true
        return img
    }()
    
    let lblHeading : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let lblSubtext: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .systemFont(ofSize: 12, weight: .light)
        lbl.textColor = .darkGray
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(imgHero)
        contentView.addSubview(lblHeading)
        contentView.addSubview(lblSubtext)
        
        imgHero.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        imgHero.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        imgHero.widthAnchor.constraint(equalToConstant: 65).isActive = true
        imgHero.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -5).isActive = true

        lblHeading.leadingAnchor.constraint(equalTo: imgHero.trailingAnchor, constant: 10).isActive = true
        lblHeading.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        lblHeading.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        
        lblSubtext.topAnchor.constraint(equalTo: lblHeading.bottomAnchor).isActive = true
        lblSubtext.leadingAnchor.constraint(equalTo: imgHero.trailingAnchor, constant: 10).isActive = true
        lblSubtext.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
