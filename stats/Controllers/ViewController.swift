//
//  ViewController.swift
//  stats
//
//  Created by Mdo on 30/01/2021.
//

import UIKit

class StatsViewController: UIViewController {
    
    //MARK: - properties
    
    let yAxisValues = Array(0...5).reversed()
    
    var values :[CGFloat] = [5,100,60,200]
    
    lazy var scrollView :UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        
        return scrollView
    }()
    
    lazy var firstSection : UIView = {
        let containerView = UIView()
        
        let verticalStackV = UIStackView()
        verticalStackV.axis = .vertical
        verticalStackV.distribution = .fillProportionally
        verticalStackV.spacing = 8
        verticalStackV.alignment = .center
        
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 23, weight: .semibold)
        title.text = "Title here"
        title.tintColor = UIColor.darkGray
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 75, height: 75))
        imageView.image = UIImage(named: "header")
        
        
        verticalStackV.addArrangedSubview(imageView)
        verticalStackV.addArrangedSubview(title)
        
        
        let separator = UIView()
        containerView.addSubview(separator)
        separator.backgroundColor = .lightGray
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.heightAnchor.constraint(equalToConstant: 0.7).isActive = true
        separator.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        separator.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.88).isActive = true
        separator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        
        
        containerView.addSubview(verticalStackV)
        
        verticalStackV.translatesAutoresizingMaskIntoConstraints = false
        verticalStackV.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        verticalStackV.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        
        let closeImageView = UIImageView()
        closeImageView.contentMode = .scaleAspectFit

        closeImageView.image = UIImage(named: "close")
        containerView.addSubview(closeImageView)
        closeImageView.translatesAutoresizingMaskIntoConstraints = false
        closeImageView.rightAnchor.constraint(equalTo: containerView.rightAnchor,constant: -15).isActive = true
        closeImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
        closeImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        closeImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        
        return containerView
    }()
    
    lazy var secendSection:UIView = {
        let containerView = UIView()
        let separator = UIView()
        containerView.addSubview(separator)
        separator.backgroundColor = .lightGray
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.heightAnchor.constraint(equalToConstant: 0.7).isActive = true
        separator.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        separator.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.88).isActive = true
        separator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        return containerView
    }()
    
    lazy var thirdSection :UIView = {
        
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
      //  contentView.backgroundColor = .systemPurple
        
        let lable = UILabel()
        contentView.addSubview(lable)
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Section title"
        lable.font = UIFont.systemFont(ofSize: 23, weight: .regular)
        
        lable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 15).isActive = true
        lable.topAnchor.constraint(equalTo:contentView.topAnchor,constant: 15).isActive = true
  
        
        
        return contentView
    }()

    
    lazy var collectionViewHeader = BarCollectionViewHeader()
    lazy var collectionViewFooter = BarCollectionViewFooter()
    lazy var backgroundView = BackgroundBarCollectionView()
    
    
    let collectionView:UICollectionView = {
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 25
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        return collectionView
        
    }()
    
    lazy var circleCollectionView:UICollectionView = {
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 25
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        
        return collectionView
    }()
    
//MARK: - ViewController life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        collectionView.register(BarCell.self, forCellWithReuseIdentifier: BarCell.reuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
       // collectionView.backgroundColor = .yellow
        configUICollectionView()

        
    }
    
    
    //MARK: - config backgroundView
    
    private func configUICollectionView(){
        view.addSubview(scrollView)
        
        scrollView.addSubview(firstSection)
        scrollView.addSubview(secendSection)
        scrollView.addSubview(thirdSection)
        
        secendSection.addSubview(collectionView)
        secendSection.addSubview(collectionViewHeader)
        secendSection.addSubview(collectionViewFooter)
        
        //scrollView
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
       // scrollView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
//
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.rightAnchor.constraint(equalTo: secendSection.rightAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: secendSection.leftAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        collectionView.topAnchor.constraint(equalTo: secendSection.topAnchor).isActive = true
//
        collectionViewHeader.translatesAutoresizingMaskIntoConstraints = false
        collectionViewHeader.rightAnchor.constraint(equalTo: collectionView.rightAnchor).isActive = true
        collectionViewHeader.leftAnchor.constraint(equalTo: collectionView.leftAnchor).isActive = true
        collectionViewHeader.topAnchor.constraint(equalTo: secendSection.topAnchor).isActive = true
        collectionViewHeader.heightAnchor.constraint(equalToConstant: 50).isActive = true
//
//        //collectionViewFooter
//
        collectionViewFooter.translatesAutoresizingMaskIntoConstraints = false
        collectionViewFooter.rightAnchor.constraint(equalTo: collectionView.rightAnchor).isActive = true
        collectionViewFooter.leftAnchor.constraint(equalTo: collectionView.leftAnchor).isActive = true
        collectionViewFooter.topAnchor.constraint(equalTo: collectionView.bottomAnchor).isActive = true
        collectionViewFooter.heightAnchor.constraint(equalToConstant: 140).isActive = true
     //   collectionViewFooter.backgroundColor = .red
        //firstSection
        
        firstSection.translatesAutoresizingMaskIntoConstraints = false
        firstSection.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        firstSection.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        firstSection.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        
        firstSection.heightAnchor.constraint(equalToConstant: 300).isActive = true
        firstSection.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
      //  firstSection.backgroundColor = .systemPurple
        
        //second section
        
        secendSection.translatesAutoresizingMaskIntoConstraints = false
        secendSection.topAnchor.constraint(equalTo: firstSection.bottomAnchor, constant: 0).isActive = true
        secendSection.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        secendSection.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        
        secendSection.heightAnchor.constraint(equalToConstant: 480).isActive = true
        secendSection.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
      //  secendSection.backgroundColor = .yellow
        
        //thirdSection
        
        
        thirdSection.topAnchor.constraint(equalTo: secendSection.bottomAnchor, constant: 0).isActive = true
        thirdSection.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        thirdSection.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        
        thirdSection.heightAnchor.constraint(equalToConstant: 430).isActive = true
        thirdSection.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        thirdSection.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
     //   third section contents
        
        
        
    
        
    
   
      //background
        collectionView.backgroundView = backgroundView
        //collectionView.backgroundColor = .red
        
    
        
    }
    
    //MARK: - addLines to background view
    
    public static func addLines(for view:UIView, at index: Int){
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.lineWidth = 0.5
        shapeLayer.lineDashPattern = [7,4]
        
        let path = CGMutablePath()
       // var y = 0
        if index == 0{
            path.addLines(between: [CGPoint(x: 0, y: 7),
                                    CGPoint(x: view.frame.width, y: 7)])
        }else if index == 5{
            //shapeLayer.lineDashPattern = [0]
            shapeLayer.lineWidth = 1
            shapeLayer.lineDashPattern = []
            
            path.addLines(between: [CGPoint(x: 10, y: 0),
                                    CGPoint(x: view.frame.width, y: 0)])
        }
        else{
            path.addLines(between: [CGPoint(x: 0, y: 0),
                                    CGPoint(x: view.frame.width, y: 0)])
        }
  
        shapeLayer.path = path
        view.layer.addSublayer(shapeLayer)
        
        
    }
    
    
    private func maxHeight() -> CGFloat {
        return collectionView.frame.height - 20 - 44 - 8
    }
    



}

//MAKR: - UICollectionView delegates

extension StatsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return values.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BarCell.reuseIdentifier, for: indexPath) as? BarCell else {
            fatalError("\(BarCell.self) could not be initialized")
        }
 
        if let max = values.max() {
            let value = values[indexPath.item]
            let ratio = value / max

            cell.barHeightConstriant?.constant = maxHeight() * ratio
        }
        
        cell.barHeightConstriant?.constant = values[indexPath.item]
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionView {
           return CGSize(width: 27, height: collectionView.frame.height)
        }
        return CGSize(width: 20, height: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == self.collectionView{
          return UIEdgeInsets(top: 0, left: 60, bottom: 0, right: 4)
        }
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 4)
    }

    
    
    
}

