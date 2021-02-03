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
        
      //  circle.layer.cornerRadius = 25
       // circle.roundedCorners(roundedRect: self.bounds, corner: [.allCorners], radius: CGSize(width: 25, height: 25))

        return circle
    }()
    
    let percentageLable: UILabel = {
        let lable = UILabel()
       // lable.translatesAutoresizingMaskIntoConstraints  = true
        lable.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        lable.text = "100%"
        lable.textColor = .white
      //  lable.textAlignment = .
        lable.textAlignment = .center
      //  lable.backgroundColor = .green
       return lable
    }()
    
    //MARK: - object life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       // self.backgroundColor = .systemPurple
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - SubView
    
    override func layoutSubviews() {
        super.layoutSubviews()
       // self.backgroundColor = .red
        addSubview(circleView)

        if percentageLable.text == "100%"{
           // circleRadiusConstriant?.constant = 50
            circleView.layer.cornerRadius = 30
            percentageLable.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
            circleView.widthAnchor.constraint(equalToConstant: 60).isActive = true
            circleView.heightAnchor.constraint(equalToConstant: 60).isActive = true
   
        }else{
            circleView.heightAnchor.constraint(equalToConstant: 40).isActive = true
          //  circleRadiusConstriant?.constant = 40
            circleView.backgroundColor = hexStringToUIColor(hex: "#094E44")
            circleView.layer.cornerRadius = 20
            circleView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        }

        circleView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        circleView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
     
        
        circleView.addSubview(percentageLable)
        
        percentageLable.translatesAutoresizingMaskIntoConstraints = false
        percentageLable.centerYAnchor.constraint(equalTo: circleView.centerYAnchor).isActive = true
        percentageLable.leftAnchor.constraint(equalTo: circleView.leftAnchor).isActive = true
        percentageLable.rightAnchor.constraint(equalTo: circleView.rightAnchor).isActive = true
        

   
    }
    
}
