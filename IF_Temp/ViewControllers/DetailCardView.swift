//
//  DetailCardView.swift
//  IF_Temp
//
//  Created by DONGGUN LEE on 10/26/19.
//  Copyright © 2019 DONGGUN LEE. All rights reserved.
//

import UIKit

@IBDesignable class DetailCardView: UIView {

    @IBInspectable var conerRadius : CGFloat = 10
    @IBInspectable var shadowColor = UIColor.black
    @IBInspectable var shadowOffSetWidth: Int = 1
    @IBInspectable var shadowOffSetHeight: Int = 1

    @IBInspectable var shadowOpacity: Float = 0.2
    
    override func layoutSubviews() {
        layer.cornerRadius = conerRadius
        layer.shadowColor = shadowColor.cgColor
        
        layer.shadowOffset = CGSize(width: shadowOffSetWidth, height: shadowOffSetHeight)
        
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: conerRadius)
        
        layer.shadowPath = shadowPath.cgPath
        
        layer.shadowOpacity = shadowOpacity
    }
}
