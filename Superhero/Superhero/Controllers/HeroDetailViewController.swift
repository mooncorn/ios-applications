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
        return chart
    }()
    
    private let kvBiography : KeyValuesListUI = {
        let list = KeyValuesListUI()
        list.translatesAutoresizingMaskIntoConstraints = false
        list.title = "Biography"
        return list
    }()
    
    private let kvAppearance : KeyValuesListUI = {
        let list = KeyValuesListUI()
        list.translatesAutoresizingMaskIntoConstraints = false
        list.title = "Appearance"
        return list
    }()
    
    private let kvConnections : KeyValuesListUI = {
        let list = KeyValuesListUI()
        list.translatesAutoresizingMaskIntoConstraints = false
        list.title = "Connections"
        return list
    }()
    
    private let kvWork : KeyValuesListUI = {
        let list = KeyValuesListUI()
        list.translatesAutoresizingMaskIntoConstraints = false
        list.title = "Work"
        return list
    }()
    
    private let scrollView : UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private let stackView : UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let imgContainer : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if superhero == nil {
            fatalError("Superhero property needs to be set")
        }
        
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        imgContainer.addSubview(imgHero)
        stackView.addArrangedSubview(imgContainer)
        stackView.addArrangedSubview(lblHeroName)
        stackView.addArrangedSubview(bcPowerstats)
        stackView.addArrangedSubview(kvBiography)
        stackView.addArrangedSubview(kvAppearance)
        stackView.addArrangedSubview(kvWork)
        stackView.addArrangedSubview(kvConnections)
        
        applyConstraints()
        
        lblHeroName.text = superhero!.name
        imgHero.load(url: URL(string: superhero!.image.url)!)
        
        let ps = superhero!.powerstats
        // setting data after applying constraints so that progress bars know what width to use
        bcPowerstats.data = [
            ("Intelligence", UIColor.blue, Int(ps.intelligence)),
            ("Strength", UIColor.red, Int(ps.strength)),
            ("Speed", UIColor.systemYellow, Int(ps.speed)),
            ("Durability", UIColor.gray, Int(ps.durability)),
            ("Power", UIColor.orange, Int(ps.power)),
            ("Combat", UIColor.purple, Int(ps.combat)),
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
        
        let app = superhero!.appearance
        kvAppearance.data = [
            ("Gender", [app.gender]),
            ("Race", [app.race]),
            ("Height", app.height),
            ("Weight", app.weight),
            ("Eye color", [app.eye_color]),
            ("Hair color", [app.hair_color])
        ]
        
        let work = superhero!.work
        kvWork.data = [
            ("Occupation", [work.occupation]),
            ("Base", [work.base])
        ]
        
        let conn = superhero!.connections
        kvConnections.data = [
            ("Group affiliation", [conn.group_affiliation]),
            ("Relatives", [conn.relatives])
        ]
    }
    
    func applyConstraints() {
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        imgContainer.leadingAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.leadingAnchor).isActive = true
        imgContainer.trailingAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.trailingAnchor).isActive = true
        imgContainer.heightAnchor.constraint(equalToConstant: 220).isActive = true
        
        imgHero.topAnchor.constraint(equalTo: imgContainer.safeAreaLayoutGuide.topAnchor).isActive = true
        imgHero.leadingAnchor.constraint(equalTo: imgContainer.safeAreaLayoutGuide.leadingAnchor, constant: view.safeAreaLayoutGuide.layoutFrame.width/2-165/2).isActive = true
        imgHero.widthAnchor.constraint(equalToConstant: 165).isActive = true
        imgHero.heightAnchor.constraint(equalToConstant: 220).isActive = true
        
        lblHeroName.leadingAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.leadingAnchor).isActive = true
        lblHeroName.trailingAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.trailingAnchor).isActive = true

        bcPowerstats.leadingAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.leadingAnchor).isActive = true
        bcPowerstats.trailingAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.trailingAnchor).isActive = true

        kvBiography.leadingAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.leadingAnchor).isActive = true
        kvBiography.trailingAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        kvAppearance.leadingAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.leadingAnchor).isActive = true
        kvAppearance.trailingAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        kvWork.leadingAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.leadingAnchor).isActive = true
        kvWork.trailingAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        kvConnections.leadingAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.leadingAnchor).isActive = true
        kvConnections.trailingAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
}
