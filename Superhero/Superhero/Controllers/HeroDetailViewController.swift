//
//  HeroDetailViewController.swift
//  Superhero
//
//  Created by David Pilarski on 2023-04-03.
//

import UIKit

class HeroDetailViewController : UIViewController {
    
    public var superhero : Superhero?
    
    private let lblHeroName : UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.font = .boldSystemFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let imgHero : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleToFill
        img.clipsToBounds = true
        return img
    }()
    
    private let bcPowerstats : BarChartUI = {
        let chart = BarChartUI()
        chart.translatesAutoresizingMaskIntoConstraints = false
        chart.title = "Powerstats"
//        chart.backgroundColor = .gray
        return chart
    }()
    
    private let kvBiography : KeyValuesListUI = {
        let list = KeyValuesListUI()
        list.translatesAutoresizingMaskIntoConstraints = false
        list.title = "Biography"
//        list.backgroundColor = .gray
        return list
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if superhero == nil {
            fatalError("Superhero property needs to be set")
        }
        
        addSubviews()
        applyConstraints()
        setData()
    }
    
    func setData() {
        lblHeroName.text = superhero!.name
        imgHero.load(url: URL(string: superhero!.image.url)!)
        
        let ps = superhero!.powerstats
        bcPowerstats.data = [
            ("Intelligence", UIColor.blue, Int(ps.intelligence)!),
            ("Strength", UIColor.red, Int(ps.strength)!),
            ("Speed", UIColor.systemYellow, Int(ps.speed)!),
            ("Durability", UIColor.gray, Int(ps.durability)!),
            ("Power", UIColor.orange, Int(ps.power)!),
            ("Combat", UIColor.purple, Int(ps.combat)!),
        ]
        
        let bio = superhero!.biography
        kvBiography.data = [
            ("Full name", [bio.full_name]),
            ("Alter egos", [bio.alter_egos]),
            ("Aliases", bio.aliases),
            ("Place of birth", [bio.place_of_birth]),
            ("First appearance", [bio.first_appearance]),
            ("Publisher", [bio.publisher]),
            ("Alignment", [bio.alignment])
        ]
    }
    
    func addSubviews() {
        view.addSubview(imgHero)
        view.addSubview(lblHeroName)
        view.addSubview(bcPowerstats)
        view.addSubview(kvBiography)
    }
    
    func applyConstraints() {
        imgHero.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        imgHero.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: view.safeAreaLayoutGuide.layoutFrame.width/2-165/2).isActive = true
        imgHero.widthAnchor.constraint(equalToConstant: 165).isActive = true
        imgHero.heightAnchor.constraint(equalToConstant: 220).isActive = true
        
        lblHeroName.topAnchor.constraint(equalTo: imgHero.bottomAnchor, constant: 10).isActive = true
        lblHeroName.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        lblHeroName.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true

        bcPowerstats.topAnchor.constraint(equalTo: lblHeroName.bottomAnchor, constant: 10).isActive = true
        bcPowerstats.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        bcPowerstats.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        bcPowerstats.heightAnchor.constraint(equalToConstant: 160).isActive = true
        print(bcPowerstats.sizeToFit())

        kvBiography.topAnchor.constraint(equalTo: bcPowerstats.bottomAnchor, constant: 10).isActive = true
        kvBiography.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        kvBiography.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        kvBiography.heightAnchor.constraint(equalToConstant: 230).isActive = true
    }
    
}
