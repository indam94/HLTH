//
//  DetailCardView.swift
//  IF_Temp
//
//  Created by DONGGUN LEE on 10/26/19.
//  Copyright © 2019 DONGGUN LEE. All rights reserved.
//

import UIKit

 class DetailCardView: UIView {

     var conerRadius : CGFloat = 10
     var shadowColor = UIColor.black
     var shadowOffSetWidth: Int = 1
     var shadowOffSetHeight: Int = 1

     var shadowOpacity: Float = 0.2
    
    var color: UIColor?
    
    override func layoutSubviews() {
        layer.cornerRadius = conerRadius
        layer.shadowColor = shadowColor.cgColor
        
        layer.shadowOffset = CGSize(width: shadowOffSetWidth, height: shadowOffSetHeight)
        
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: conerRadius)
        
        layer.shadowPath = shadowPath.cgPath
        
        layer.shadowOpacity = shadowOpacity
        
        layer.backgroundColor = color?.cgColor
    }
}
