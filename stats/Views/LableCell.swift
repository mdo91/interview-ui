//
//  LableCell.swift
//  stats
//
//  Created by Mdo on 06/02/2021.
//

import Foundation
import UIKit

class LableCell:UICollectionViewCell{
    
    
    
    //MARK: - properties
    
    static let reuseIdentifier = String(describing: LableCell.self)
    
    lazy var lable:UILabel = {
       let lable = UILabel()
        lable.font = UIFont.systemFont(ofSize: 16)//#ecf0f1
        lable.backgroundColor = hexStringToUIColor(hex: "#dcdde1")
        lable.layer.cornerRadius = 20
        lable.layer.masksToBounds = true
        lable.textAlignment = .center
        
        
        return lable
    }()
    
    //MARK: - Object life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //self.backgroundColor = .systemPurple
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - view life cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(lable)
        lable.translatesAutoresizingMaskIntoConstraints = false

        lable.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        lable.leftAnchor.constraint(equalTo: leftAnchor).isActive = true

        lable.heightAnchor.constraint(equalToConstant: 45).isActive = true
        lable.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        lable.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
    
    
    
    
}
