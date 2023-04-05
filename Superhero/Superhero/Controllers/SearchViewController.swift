//
//  ViewController.swift
//  Superhero
//
//  Created by David Pilarski on 2023-03-29.
//

import UIKit

class SearchViewController {
    
//    private var barChart: BarChartUI = BarChartUI()
//    private var keyValuesList: KeyValuesListUI = KeyValuesListUI()
//
//    var powerstatsData = [
//        ("Intelligence", UIColor.blue, 100),
//        ("Strength", UIColor.red, 80),
//        ("Speed", UIColor.systemYellow, 20),
//        ("Durability", UIColor.gray, 90),
//        ("Power", UIColor.orange, 80),
//        ("Combat", UIColor.purple, 95),
//    ]
//
//    var biographyData = [
//        ("Full name", ["Bruce Wayne"]),
//        ("Alter egos", ["No alter egos found."]),
//        ("Aliases", ["Insider", "Matches Malone"]),
//        ("Place of birth", ["Crest Hill, Bristol Township", "Gotham County"]),
//        ("First appearance", ["Detective Comics #27"]),
//        ("Publisher", ["DC Comics"]),
//        ("Alignment", ["good"])
//    ]
//
//    let searchView = SuperheroSearchUI()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        addSubviews()
//        applyConstraints()
//
//        barChart.title = "Power Stats"
//        barChart.data = powerstatsData
//
//        keyValuesList.title = "Biography"
//        keyValuesList.data = biographyData
//
//        searchView.delegate = self
//    }
//
//    private func addSubviews() {
//        view.addSubview(barChart)
//        view.addSubview(keyValuesList)
//        view.addSubview(searchView)
//    }
//
//    private func applyConstraints() {
//        barChart.translatesAutoresizingMaskIntoConstraints = false
//        barChart.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
//        barChart.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
//        barChart.widthAnchor.constraint(equalToConstant: 350).isActive = true
//        barChart.heightAnchor.constraint(equalToConstant: 150).isActive = true
//
//        keyValuesList.translatesAutoresizingMaskIntoConstraints = false
//        keyValuesList.topAnchor.constraint(equalTo: barChart.bottomAnchor, constant: 10).isActive = true
//        keyValuesList.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
//        keyValuesList.widthAnchor.constraint(equalToConstant: 350).isActive = true
//        keyValuesList.heightAnchor.constraint(equalToConstant: 220).isActive = true
//
//        searchView.translatesAutoresizingMaskIntoConstraints = false
//        searchView.topAnchor.constraint(equalTo: keyValuesList.bottomAnchor, constant: 10).isActive = true
//        searchView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
//        searchView.widthAnchor.constraint(equalToConstant: 350).isActive = true
//        searchView.heightAnchor.constraint(equalToConstant: 300).isActive = true
//    }
//
//    func didSelectSuperhero(superhero: Superhero) {
//
//        keyValuesList.removeFromSuperview()
//        barChart.removeFromSuperview()
//
//        barChart = BarChartUI()
//        keyValuesList = KeyValuesListUI()
//
//        keyValuesList.title = "Biography"
//        barChart.title = "Powerstats"
//
//        let ps = superhero.powerstats
//        let bio = superhero.biography
//
//        barChart.data = [
//            ("Intelligence", UIColor.blue, Int(ps.intelligence)!),
//            ("Strength", UIColor.red, Int(ps.strength)!),
//            ("Speed", UIColor.systemYellow, Int(ps.speed)!),
//            ("Durability", UIColor.gray, Int(ps.durability)!),
//            ("Power", UIColor.orange, Int(ps.power)!),
//            ("Combat", UIColor.purple, Int(ps.combat)!),
//        ]
//
//        keyValuesList.data = [
//            ("Full name", [bio.full_name]),
//            ("Alter egos", [bio.alter_egos]),
//            ("Aliases", bio.aliases),
//            ("Place of birth", [bio.place_of_birth]),
//            ("First appearance", [bio.first_appearance]),
//            ("Publisher", [bio.publisher]),
//            ("Alignment", [bio.alignment])
//        ]
//
//        addSubviews()
//        applyConstraints()
//    }
}

