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
    
    private var selectedSuperhero : Superhero?
    
    private let searchBar : UISearchBar = {
        let sb = UISearchBar()
        sb.translatesAutoresizingMaskIntoConstraints = false
        sb.placeholder = "Search for a superhero..."
        return sb
    }()
    
    private let lblResultCount : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .darkGray
        lbl.font = .systemFont(ofSize: 12)
        return lbl
    }()
    
    private let resultList : UITableView = {
        let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.rowHeight = 75
        return tb
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Search"
        
        searchBar.delegate = self
        
        resultList.register(ListViewCellUI.self, forCellReuseIdentifier: "cell")
        resultList.delegate = self
        resultList.dataSource = self
        
        view.addSubviews(searchBar, lblResultCount, resultList)
        applyConstraints()
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

