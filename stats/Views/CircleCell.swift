//
//  CircleCell.swift
//  stats
//
//  Created by Mdo on 01/02/2021.
//

import Foundation
import UIKit

class CircleCell:UICollectionViewCell{
    
    var circleRadiusConstriant: NSLayoutConstraint?
    
    static let reuseIdentifier = String(describing:CircleCell.self)
    
    lazy var circleView:UIView = {
        
        let circle = UIView()
        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.backgroundColor = hexStringToUIColor(hex: "#0D7C6C")
        
        circle.layer.cornerRadius = 25

        return circle
    }()
    
    let percentageLable: UILabel = {
        let lable = UILabel()
       // lable.translatesAutoresizingMaskIntoConstraints  = true
        lable.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        lable.text = "100%"
        lable.textColor = .white
        lable.textAlignment = .center
      //  lable.backgroundColor = .green
       return lable
    }()
    
    //MARK: - object life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - SubView
    
    override func layoutSubviews() {
        super.layoutSubviews()
       // self.backgroundColor = .red
        addSubview(circleView)
        
        circleRadiusConstriant = circleView.widthAnchor.constraint(equalToConstant: 50)
        circleRadiusConstriant?.isActive = true
        circleRadiusConstriant?.constant = 50
        
        
        
        circleView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        circleView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        circleView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
     
        
        circleView.addSubview(percentageLable)
        
        percentageLable.translatesAutoresizingMaskIntoConstraints = false
        percentageLable.centerYAnchor.constraint(equalTo: circleView.centerYAnchor).isActive = true
        percentageLable.leftAnchor.constraint(equalTo: circleView.leftAnchor).isActive = true
        percentageLable.rightAnchor.constraint(equalTo: circleView.rightAnchor).isActive = true
   
    }
    
}
