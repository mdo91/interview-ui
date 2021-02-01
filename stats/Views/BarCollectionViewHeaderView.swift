//
//  CollectionViewHeader.swift
//  stats
//
//  Created by Mdo on 31/01/2021.
//

import Foundation
import UIKit

class BarCollectionViewHeader:UIView{
    
    //MARK: - properties
    lazy var averageLable :UILabel = {
       let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "avg"
        lable.font = UIFont.systemFont(ofSize: 19)
        lable.tintColor = .black
        return lable
    }()
    
    lazy var averageValueLable :UILabel = {
       let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "5.7"
        lable.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        lable.textColor = hexStringToUIColor(hex: "#00A88F")
       // lable.textColor
        return lable
    }()
    
    lazy var graphTitle:UILabel = {
       let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Graph title"
        lable.font = UIFont.systemFont(ofSize: 23, weight: .regular)
        return lable
    }()
    
    //MARK: - object life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
      //  self.backgroundColor = .red
        addSubview(averageLable)
        addSubview(averageValueLable)
        addSubview(graphTitle)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
       
    }
    
    //MARK: - Viewlife cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        averageLable.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        averageLable.topAnchor.constraint(equalTo: topAnchor,constant: 15).isActive = true
        
        averageValueLable.centerYAnchor.constraint(equalTo: averageLable.centerYAnchor).isActive = true
        
        averageValueLable.trailingAnchor.constraint(equalTo: averageLable.leadingAnchor, constant: -10).isActive = true
        
        
        graphTitle.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 15).isActive = true
        graphTitle.centerYAnchor.constraint(equalTo: averageValueLable.centerYAnchor).isActive = true
        
        
        
    }
    
    
}
