//
//  BarChartUI.swift
//  Superhero
//
//  Created by David Pilarski on 2023-03-29.
//

import UIKit

/*
  A customized view that displays a bar graph. It renders a graph based on data provided.
 */
class BarChartUI : UIView {
    
    /*
     Title of the graph.
     */
    public var title : String {
        didSet {
            lblTitle.text = title
        }
    }
    
    /*
     An array of sets. One set defines one entry for the bar graph. As soon as the data is set, the graph will be generated.
     String: heading text for the entry
     UIColor: background color for the progress bar view
     Int: value that determines the width of the progress bar
    */
    public var data : [(String, UIColor, Int)] {
        didSet {
            generateGraph()
        }
    }
    
    /*
     Label that displays the title of the graph.
     */
    private var lblTitle : UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .left
        lbl.font = .boldSystemFont(ofSize: 14)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    /*
     Label that is shown when there is no data.
     */
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        self.title = "Title"
        self.data = []
        super.init(frame: frame)
        
        addSubviews(lblTitle, lblNoData)
        applyConstraints()
        
        generateGraph()
    }
    
    private func generateGraph() {
        lblNoData.isHidden = !data.isEmpty
        guard !data.isEmpty else { return }
        
        var topView = lblTitle
        
        for entry in data {
            let headingText = entry.0
            let barColor = entry.1
            let value = Utils.convertTo0To100Range(num: entry.2)
            
            let lblHeading = makeHeadingLabel(headingText)
            let lblValue = makeValueLabel(String(value))
            let viewProgressBar = makeProgressBar(barColor)
            
            addSubviews(lblHeading, lblValue, viewProgressBar)
            
            applyConstraintsToRowElements(lblHeading, lblValue, viewProgressBar, value, topView)
            
            topView = lblHeading
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
    
    private func makeHeadingLabel( _ headingText : String) -> UILabel {
        let lbl = UILabel()
        lbl.textAlignment = .left
        lbl.font = .systemFont(ofSize: 12)
        lbl.text = headingText
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }
    
    private func makeValueLabel( _ value : String) -> UILabel {
        let lbl = UILabel()
        lbl.tag = 1
        lbl.textAlignment = .right
        lbl.font = .systemFont(ofSize: 12)
        lbl.textColor = .darkGray
        lbl.text = value
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }
    
    private func makeProgressBar( _ color: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    private func applyConstraintsToRowElements(_ lblHeading: UILabel, _ lblValue: UILabel, _ viewProgressBar: UIView, _ value: Int, _ topView: UILabel) {
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
    }
}
