//
//  KeyValuesListUI.swift
//  Superhero
//
//  Created by David Pilarski on 2023-03-29.
//

import UIKit

class KeyValuesListUI : UIView {
    
    public var title: String {
        didSet {
            lblTitle.text = title
        }
    }
    
    public var data: [(String, [String])] {
        didSet {
            generateGraph()
        }
    }
    
    private var lblTitle: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .left
        lbl.font = .boldSystemFont(ofSize: 14)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private var lblNoData: UILabel = {
        let lbl = UILabel()
        lbl.tag = 2
        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 12)
        lbl.textColor = .darkGray
        lbl.text = "No data"
        lbl.isHidden = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    // i'm sure there's a better way to do this
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 0.0, height: {            
            if subviews.first(where: { v in v.tag == 2})?.isHidden == false {
                return 80
            }
            
            let valueLabels = subviews.filter({ v in v.tag == 1 })
            
            var heightForValuesLabels = 0.0
            
            valueLabels.forEach({ lbl in heightForValuesLabels = heightForValuesLabels + lbl.safeAreaLayoutGuide.layoutFrame.height})
            
            return heightForValuesLabels + Double(valueLabels.count * 5) + 35
        }())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        self.title = "Title"
        self.data = []
        super.init(frame: frame)
  
        clipsToBounds = true
        
        addSubview(lblTitle)
        addSubview(lblNoData)
        
        applyConstraints()
        generateGraph()
    }
    
    private func generateGraph() {
        lblNoData.isHidden = !data.isEmpty
        guard !data.isEmpty else { return }
        
        var topView = lblTitle
        
        for entry in data {
            let heading = entry.0
            let values = entry.1
            
            // create ui elements for each entry
            let lblEntryHeading: UILabel = {
                let lbl = UILabel()
                lbl.textAlignment = .left
                lbl.font = .systemFont(ofSize: 12)
                lbl.text = heading
                lbl.translatesAutoresizingMaskIntoConstraints = false
                return lbl
            }()
            
            let lblEntryValues: UILabel = {
                let lbl = UILabel()
                lbl.tag = 1
                lbl.textAlignment = .left
                lbl.font = .systemFont(ofSize: 12, weight: .light)
                lbl.numberOfLines = values.count
                lbl.text = values.joined(separator: "\n")
                lbl.translatesAutoresizingMaskIntoConstraints = false
                return lbl
            }()
        
            
            // add ui elements to the view
            addSubview(lblEntryHeading)
            addSubview(lblEntryValues)
            
            // apply constraints
            lblEntryHeading.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 5).isActive = true
            lblEntryHeading.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
            lblEntryHeading.widthAnchor.constraint(equalToConstant: 100).isActive = true
            
            lblEntryValues.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 5).isActive = true
            lblEntryValues.leadingAnchor.constraint(equalTo: lblEntryHeading.trailingAnchor, constant: 5).isActive = true
            lblEntryValues.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
            
            // set top view as current entry title
            topView = lblEntryValues
        }
    }
    
    private func applyConstraints() {
        lblTitle.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        lblTitle.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        lblTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        
        lblNoData.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        lblNoData.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        lblNoData.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 10).isActive = true
    }
    
}

