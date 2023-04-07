//
//  BarChartUI.swift
//  Superhero
//
//  Created by David Pilarski on 2023-03-29.
//

import UIKit

class BarChartUI : UIView {

    public var title : String {
        didSet {
            lblTitle.text = title
        }
    }
 
    public var data : [(String?, UIColor?, Int?)] {
        didSet {
            generateGraph()
        }
    }
    
    override init(frame: CGRect) {
        title = ""
        data = []
        super.init(frame: frame)
        
        generateGraph()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var lblTitle : UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .left
        lbl.font = .boldSystemFont(ofSize: 14)
        lbl.text = "Title"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private var lblNoData : UILabel = {
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
    
    private func generateGraph() {
        // remove all subviews
        subviews.forEach({v in v.removeFromSuperview()})
        
        // add title and no data labels
        addSubviews(lblTitle, lblNoData)
        applyConstraints()

        // control no data label display
        lblNoData.isHidden = !data.isEmpty
        guard !data.isEmpty else { return }
        
        var topView = lblTitle
        
        for entry in data {
            let headingText = entry.0
            let barColor = entry.1
            let value = Utils.convertTo0To100Range(num: entry.2 ?? 0)
            
            let lblHeading : UILabel = {
                let lbl = UILabel()
                lbl.textAlignment = .left
                lbl.font = .systemFont(ofSize: 12)
                lbl.text = headingText
                lbl.translatesAutoresizingMaskIntoConstraints = false
                return lbl
            }()
            
            let lblValue : UILabel = {
                let lbl = UILabel()
                lbl.tag = 1
                lbl.textAlignment = .right
                lbl.font = .systemFont(ofSize: 12)
                lbl.textColor = .darkGray
                lbl.text = String(value)
                lbl.translatesAutoresizingMaskIntoConstraints = false
                return lbl
            }()
            
            let viewProgressBar : UIView = {
                let view = UIView()
                view.backgroundColor = barColor
                view.translatesAutoresizingMaskIntoConstraints = false
                return view
            }()
            
            addSubviews(lblHeading, lblValue, viewProgressBar)
            
            lblHeading.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 5).isActive = true
            lblHeading.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
            lblHeading.widthAnchor.constraint(equalToConstant: 100).isActive = true
            
            lblValue.topAnchor.constraint(equalTo: lblHeading.topAnchor).isActive = true
            lblValue.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
            lblValue.widthAnchor.constraint(equalToConstant: 30).isActive = true
            
            let maxWidth = safeAreaLayoutGuide.layoutFrame.width - 30 - lblHeading.safeAreaLayoutGuide.layoutFrame.width - lblValue.safeAreaLayoutGuide.layoutFrame.width
            
            viewProgressBar.topAnchor.constraint(equalTo: lblHeading.topAnchor).isActive = true
            viewProgressBar.leadingAnchor.constraint(equalTo: lblHeading.trailingAnchor, constant: 5).isActive = true
            viewProgressBar.heightAnchor.constraint(equalTo: lblHeading.heightAnchor).isActive = true
            viewProgressBar.widthAnchor.constraint(equalToConstant: (CGFloat(value) * maxWidth) / 100).isActive = true
            
            topView = lblHeading
        }
        
        // set own height
        heightAnchor.constraint(equalToConstant: intrinsicContentSize.height).isActive = true
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
