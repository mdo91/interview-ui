//
//  BarCollectionViewFooter.swift
//  stats
//
//  Created by Mdo on 31/01/2021.
//

import Foundation
import UIKit


class BarCollectionViewFooter:UIView{
    
    
    //MARK: - properties
    
    let dates = ["Oct 19","Oct 20","Oct 21","Oct 22","Oct 23","Oct 24","Oct 25"]
    let filter = ["WEEKLY","21 DAY"]
    lazy var daysContainer:UIView = {
        
        let container = UIView(frame: CGRect.zero)
        container.translatesAutoresizingMaskIntoConstraints = false
        let daysStackView = UIStackView()
        
        daysStackView.translatesAutoresizingMaskIntoConstraints = false
        daysStackView.alignment = .fill
        daysStackView.distribution = .equalSpacing
        daysStackView.spacing = 2
        daysStackView.axis = .horizontal
        
        for index in 0..<7{
            let lable = UILabel()
           // lable.backgroundColor = .lightGray
            lable.font = UIFont.systemFont(ofSize: 15)
            lable.tintColor = .black
            lable.text = dates[index]
            lable.rotate(degrees: -60)
            daysStackView.addArrangedSubview(lable)

        }
        container.addSubview(daysStackView)
        daysStackView.leadingAnchor.constraint(equalTo: container.leadingAnchor,constant: 55).isActive = true
        daysStackView.trailingAnchor.constraint(equalTo:container.trailingAnchor,constant: -20).isActive = true
        daysStackView.topAnchor.constraint(equalTo: container.topAnchor,constant: -55).isActive = true
        
        daysStackView.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        
        
    
     //   daysStackView.backgroundColor = .yellow
       // container.backgroundColor = .red
        return container
    }()
    
    
    
    //MARK: - Object lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(daysContainer)
        
        daysContainer.topAnchor.constraint(equalTo: topAnchor).isActive = true
        daysContainer.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        daysContainer.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        daysContainer.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        let segmentedControl = UISegmentedControl(items: filter)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        segmentedControl.setTitle("WEEKLY", forSegmentAt: 0)
        segmentedControl.setTitle("21 DAY", forSegmentAt: 1)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = .white
        segmentedControl.tintColor = .white
        segmentedControl.layer.borderColor = hexStringToUIColor(hex: "#00A88F").cgColor
        segmentedControl.layer.borderWidth = 0.5

        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10), NSAttributedString.Key.foregroundColor: UIColor.white ], for: .selected)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10), NSAttributedString.Key.foregroundColor: hexStringToUIColor(hex: "#00A88F") ], for: .normal)
      
        segmentedControl.selectedSegmentTintColor = hexStringToUIColor(hex: "#00A88F")
        
        daysContainer.addSubview(segmentedControl)
        
        segmentedControl.bottomAnchor.constraint(equalTo: daysContainer.bottomAnchor,constant: -5).isActive = true
        segmentedControl.centerXAnchor.constraint(equalTo: daysContainer.centerXAnchor).isActive = true
        segmentedControl.widthAnchor.constraint(equalToConstant:160).isActive = true
        segmentedControl.isEnabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - view life cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        
 
        
        
        
    }
    
    
}
