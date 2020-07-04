//
//  CardView.swift
//  football-app
//
//  Created by Yovi Eka Putra on 04/07/20.
//  Copyright © 2020 Yovi Eka Putra. All rights reserved.
//

import UIKit

@IBDesignable
class CardView: UIView {
    @IBInspectable var cardRadius: CGFloat = 4
    @IBInspectable var shadowOffsetWidth: CGFloat = 0
    @IBInspectable var shadowOffsetHeight: CGFloat = 2
    @IBInspectable var shadowOpacity: Float = 0.5
    @IBInspectable var shadowColor: UIColor = .gray
    
    override func layoutSubviews() {
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cardRadius)
        layer.cornerRadius = cardRadius
        layer.masksToBounds = false
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
    }
}
