//
//  BuzzbleView.swift
//  Todoey-CoreDataExample
//
//  Created by Pratik Bhaliya on 2/4/19.
//  Copyright © 2019 Pratik Bhaliya. All rights reserved.
//

import UIKit

protocol BuzzableView {}

extension BuzzableView where Self: UIView {
    func buzz () {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 5.0, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 5.0, y: self.center.y))
        layer.add(animation, forKey: "position")
        
    }
}
