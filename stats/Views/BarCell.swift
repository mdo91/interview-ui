//
//  BarCell.swift
//  stats
//
//  Created by Mdo on 30/01/2021. describing
//

import Foundation
import UIKit

class BarCell:UICollectionViewCell{
    
    //MARK: - properties
    
    lazy var barView:UIView = {
        
        let view = UIView()
        let firstGreen = hexStringToUIColor(hex: "#70DEB0")
        let secondGreen = hexStringToUIColor(hex: "#0D7C6C")

        // https://medium.com/better-programming/swift-gradient-in-4-lines-of-code-6f81809da741

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [secondGreen.cgColor,firstGreen.cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
        view.roundedCorners(roundedRect: self.bounds, corner: [.topRight, .topLeft], radius:CGSize(width: 10, height: 10))
        return view
    }()
    
    var barHeightConstriant: NSLayoutConstraint?
    
    static let reuseIdentifier = String(describing:BarCell.self)
    
    override init(frame: CGRect ) {
        super.init(frame: frame)
        configUIConstaints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    //MARK: - configUIConstaints
    
    private func configUIConstaints(){
        
        addSubview(barView)
        barView.translatesAutoresizingMaskIntoConstraints = false
        barHeightConstriant = barView.heightAnchor.constraint(equalToConstant: 300)
        barHeightConstriant?.isActive = true
        barHeightConstriant?.constant = 100
        
      //  print(" barHeightConstriant?.constant \( barHeightConstriant?.constant)")
        barView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -30).isActive = true
        barView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        barView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
    }
}
