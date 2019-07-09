//
//  ViewExtentions.swift
//  Request a Review
//
//  Created by Pratik Bhaliya on 1/5/19.
//  Copyright © 2019 Pratik Bhaliya. All rights reserved.
//

import UIKit

@IBDesignable
    class ViewExtentions: UIButton {
        
        // MARK: - Gradient
        
        @IBInspectable var firstColor: UIColor = UIColor.white {
            didSet {
                updateView()
            }
        }
        
        @IBInspectable var secondColor: UIColor = UIColor.white {
            didSet {
                updateView()
            }
        }
        
        @IBInspectable var horizontalGradient: Bool = false {
            didSet {
                updateView()
            }
        }
        
        override class var layerClass: AnyClass {
            get {
                return CAGradientLayer.self
            }
        }
        
        func updateView() {
            let layer = self.layer as! CAGradientLayer
            layer.colors = [ firstColor.cgColor, secondColor.cgColor ]
            
            if (horizontalGradient) {
                layer.startPoint = CGPoint(x: 0.0, y: 0.5)
                layer.endPoint = CGPoint(x: 1.0, y: 0.5)
            } else {
                layer.startPoint = CGPoint(x: 0, y: 0)
                layer.endPoint = CGPoint(x: 0, y: 1)
            }
        }
        
        // MARK: - Border
        
        @IBInspectable public var borderColor: UIColor = UIColor.clear {
            didSet {
                layer.borderColor = borderColor.cgColor
            }
        }
        
        @IBInspectable public var borderWidth: CGFloat = 0 {
            didSet {
                layer.borderWidth = borderWidth
            }
        }
        
        @IBInspectable public var cornerRadius: CGFloat = 0 {
            didSet {
                layer.cornerRadius = cornerRadius
            }
        }
        
        // MARK: - Shadow
        
        @IBInspectable public var shadowOpacity: CGFloat = 0 {
            didSet {
                layer.shadowOpacity = Float(shadowOpacity)
            }
        }
        
        @IBInspectable public var shadowColor: UIColor = UIColor.clear {
            didSet {
                layer.shadowColor = shadowColor.cgColor
            }
        }
        
        @IBInspectable public var shadowRadius: CGFloat = 0 {
            didSet {
                layer.shadowRadius = shadowRadius
            }
        }
        
        @IBInspectable public var shadowOffsetY: CGFloat = 0 {
            didSet {
                layer.shadowOffset.height = shadowOffsetY
            }
        }
}

@IBDesignable class GradientButton:UIButton {
    
    @IBInspectable
    var topGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, bottomGradientColor: bottomGradientColor)
        }
    }
    
    @IBInspectable
    var bottomGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, bottomGradientColor: bottomGradientColor)
        }
    }
    
    private func setGradient(topGradientColor: UIColor?, bottomGradientColor: UIColor?) {
        let gradientLayer = CAGradientLayer()
        if let topGradientColor = topGradientColor, let bottomGradientColor = bottomGradientColor {
            gradientLayer.frame = bounds
            gradientLayer.colors = [topGradientColor.cgColor, bottomGradientColor.cgColor]
            gradientLayer.locations = [0.0,1.0]
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
            layer.insertSublayer(gradientLayer, at: 0)
        } else {
            gradientLayer.removeFromSuperlayer()
        }
    }
}
