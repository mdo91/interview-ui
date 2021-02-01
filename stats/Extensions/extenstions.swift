//
//  extenstions.swift
//  stats
//
//  Created by Mdo on 31/01/2021.
// https://stackoverflow.com/questions/10167266/how-to-set-cornerradius-for-only-top-left-and-top-right-corner-of-a-uiview
// https://stackoverflow.com/questions/28717634/how-can-you-rotate-text-for-uibutton-and-uilabel-in-swift

import Foundation
import UIKit


extension UIView{

    func roundedCorners(roundedRect: CGRect,corner:UIRectCorner, radius:CGSize){
        let path = UIBezierPath(roundedRect: roundedRect, byRoundingCorners: corner, cornerRadii: radius)
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func rotate(degrees:CGFloat){
        rotate(radians: CGFloat.pi * degrees / 180)
    }
    
    func rotate(radians:CGFloat){
        self.transform = CGAffineTransform(rotationAngle: radians)
    }
}
