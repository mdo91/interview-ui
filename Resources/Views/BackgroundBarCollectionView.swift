//
//  BackgroundBarCollectionView.swift
//  stats
//
//  Created by Mdo on 01/02/2021.
//

import Foundation
import UIKit

class BackgroundBarCollectionView:UIView{
    
    //MARK: - properties
    
    let yAxisValues = Array(0...5).reversed()
    
    lazy var backgroundView:UIView = {

        let containerView = UIView()

        
        print("containerView \(containerView.frame.width)")
        containerView.backgroundColor = UIColor.white
        let LinesStackView = UIStackView()
        LinesStackView.translatesAutoresizingMaskIntoConstraints = false
        LinesStackView.alignment = .fill
        LinesStackView.distribution = .equalSpacing
        LinesStackView.axis = .vertical
        LinesStackView.spacing = 45
       // LinesStackView.backgroundColor = .systemPurple
         var viewArray = [UIView]()
        for index in 0...5{
            // todo change width
            let view = UIView(frame:CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 0.5))
            view.heightAnchor.constraint(equalToConstant: 1).isActive = true
            view.translatesAutoresizingMaskIntoConstraints = false

            if index == 5{
                LinesStackView.addArrangedSubview(view)
                StatsViewController.addLines(for: view, at: index)
               
      
            }else{
                LinesStackView.addArrangedSubview(view)
                StatsViewController.addLines(for: view, at: 0)
                print("mdo \(index) \(view.bounds)")
            }
     
              
        }
        
        let numbersStackView  = UIStackView()
        numbersStackView.translatesAutoresizingMaskIntoConstraints = false
        numbersStackView.axis = .vertical
        numbersStackView.distribution = .equalSpacing
        numbersStackView.alignment = .center
        numbersStackView.spacing = 25
        for index in yAxisValues{
            let lable = UILabel()
            lable.font = UIFont.systemFont(ofSize: 17)
           // lable.numberOfLines = 1
            lable.tintColor = UIColor.black
        //    lable.backgroundColor = .gray
            lable.textAlignment = .center
            let value = index * 2 == 0 ? "" : "\(index * 2)"
            lable.text = value
            lable.text! += lable.text == "10" ? "+" : ""
            numbersStackView.addArrangedSubview(lable)
        }
        
       // LinesStackView.backgroundColor = .yellow
        let mainStackView = UIStackView(arrangedSubviews: [numbersStackView,LinesStackView])
        mainStackView.axis = .horizontal
        mainStackView.distribution = .fill
        mainStackView.spacing = 8
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.alignment = .fill
       // mainStackView.backgroundColor = .systemPurple
        //containerView.backgroundColor = .red
        containerView.addSubview(mainStackView)

        LinesStackView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.90).isActive = true

        numbersStackView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.1).isActive = true

        mainStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        mainStackView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        
        //mainStackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
    //    mainStackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
 
 


        return containerView
    }()
    
    //MARK: object life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
//        backgroundView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        backgroundView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MAKR: layout lifecycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
    }
}
