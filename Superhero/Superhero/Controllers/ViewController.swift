//
//  ViewController.swift
//  Superhero
//
//  Created by David Pilarski on 2023-03-29.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    var data : [Superhero] = [] {
        didSet {
            let resultString = data.count == 1 ? "result" : "results"
            lblResultCount.text = "\(data.count) \(resultString) for \"\(searchBar.text!)\""
            
            resultList.reloadData()
        }
    }
    
    var selectedSuperhero : Superhero?
    
    let searchBar : UISearchBar = {
        let sb = UISearchBar()
        sb.translatesAutoresizingMaskIntoConstraints = false
        sb.placeholder = "Search for a superhero..."
        return sb
    }()
    
    let lblResultCount : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .darkGray
        lbl.font = .systemFont(ofSize: 12)
        return lbl
    }()
    
    let resultList : UITableView = {
        let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.rowHeight = 75
        return tb
    }()
    
//    let list = {
//        let kv = KeyValuesListUI()
//        kv.translatesAutoresizingMaskIntoConstraints = false
//        kv.backgroundColor = .lightGray
//        kv.title = "Testing"
//        kv.data = [
//            ("Full name", ["fsdafas", "fdsafasf"]),
//            ("Alter egos", ["fsdfsdaf"]),
//            ("Aliases", ["fdsafsd", "fdsafs"]),
//            ("Place of birth", ["fdsafsd", "fdsafs"]),
//            ("First appearance", ["fdsafsd", "fdsafs"]),
//            ("Publisher", ["fdsafsd", "fdsafs"]),
//            ("Alignment", ["fdsafsd", "fdsafs", "fdsafsd", "fdsafs"])
//        ]
//        return kv
//    }()
//    
//    let bars = {
//        let kv = BarChartUI()
//        kv.translatesAutoresizingMaskIntoConstraints = false
//        kv.backgroundColor = .lightGray
//        kv.title = "Testing"
//        kv.data = [
//            ("Intelligence", UIColor.blue, 80),
//            ("Strength", UIColor.red, 70),
//            ("Speed", UIColor.systemYellow, 100),
//            ("Durability", UIColor.gray, 33),
//            ("Power", UIColor.orange, 9),
//            ("Combat", UIColor.purple, 99),
//        ]
//        return kv
//    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Search"
        
        searchBar.delegate = self
        
        resultList.register(ListViewCellUI.self, forCellReuseIdentifier: "cell")
        resultList.delegate = self
        resultList.dataSource = self
        
        addSubviews()
        applyConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(searchBar)
        view.addSubview(lblResultCount)
        view.addSubview(resultList)
        
//        view.addSubview(list)
//        view.addSubview(bars)
    }

    private func applyConstraints() {
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        lblResultCount.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 5).isActive = true
        lblResultCount.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        lblResultCount.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        
        resultList.topAnchor.constraint(equalTo: lblResultCount.bottomAnchor, constant: 5).isActive = true
        resultList.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        resultList.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        resultList.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
//
//        list.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
//        list.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
//        list.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
//        list.heightAnchor.constraint(equalToConstant: list.intrinsicContentSize.height).isActive = true
//
//        bars.topAnchor.constraint(equalTo: list.bottomAnchor, constant: 10).isActive = true
//        bars.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
//        bars.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
//        bars.heightAnchor.constraint(equalToConstant: bars.intrinsicContentSize.height).isActive = true
//        print(bars.intrinsicContentSize)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListViewCellUI
        
        let superhero = data[indexPath.row]
        
        cell.headingText = superhero.name
        cell.imgUrl = superhero.image.url
        cell.subtext = superhero.biography.full_name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedSuperhero = data[indexPath.row]
        performSegue(withIdentifier: Segue.toHeroDetail, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segue.toHeroDetail {
            let heroDetails = segue.destination as! HeroDetailViewController
            heroDetails.superhero = selectedSuperhero
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let term = searchBar.text {
            SuperheroAPI.search(term: term, successHandler: { statusCode, response in
                let searchResults = SuperHeroAPISearch.decode(json: response)
                
                if let results = searchResults?.results {
                    DispatchQueue.main.async {
                        self.data = results
                    }
                } else {
                    DispatchQueue.main.async {
                        self.data = []
                    }
                }
            }, failHandler: { statusCode, error in
                print(statusCode, error)
            })
        }
    }
}

